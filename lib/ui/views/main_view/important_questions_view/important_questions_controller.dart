import 'package:flutter_templete/core/data/models/apis/question_model.dart';
import 'package:flutter_templete/core/data/reposotories/important_questions_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:get/get.dart';

import '../../../../core/enums/operation_type.dart';
import '../../../shared/custom_widgets/custom_toast.dart';

class ImportantQuestionsController extends BaseController {
  RxList<QuestionModel> importantQuestions = <QuestionModel>[].obs;
  RxBool isImportant = true.obs;
  bool get isImportantQuestionsLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.QUESTIONS);
  RxInt selectedAnswer = (-1).obs;
  @override
  void onInit() {
    getImportantQuestions();
    super.onInit();
  }

  getImportantQuestions() {
    runFutureFunctionWithLoading(
        operationType: OperationType.QUESTIONS,
        function: ImportantRepository()
            .getImportantQuestions()
            .then((value) => value.fold(
                  (l) => CustomToast.showMessage(
                      message: l, messageType: MessageType.REJECTED),
                  (r) {
                    importantQuestions.clear();
                    importantQuestions.addAll(r);
                  },
                )));
  }

  removeFromImportants(int id) {
    runFutureFunctionWithLoading(
        function: ImportantRepository()
            .removeFromImportants(questionID: id)
            .then((value) => value.fold(
                (l) => CustomToast.showMessage(message: l),
                (r) => CustomToast.showMessage(
                    message: tr("key_important_added"),
                    messageType: MessageType.SUCCESS))));
  }

  addToImportants(int id) {
    runFutureFunctionWithLoading(
        function: ImportantRepository().addToImportants(questionID: id).then(
            (value) => value.fold(
                (l) => CustomToast.showMessage(message: l),
                (r) => CustomToast.showMessage(
                    message: tr("key_important_removed"),
                    messageType: MessageType.SUCCESS))));
  }
}
