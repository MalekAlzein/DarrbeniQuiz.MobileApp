import 'package:flutter_templete/core/data/models/apis/impotant_model.dart';
import 'package:flutter_templete/core/data/reposotories/important_questions_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

import '../../../../core/enums/operation_type.dart';
import '../../../shared/custom_widgets/custom_toast.dart';

class ImportantQuestionsController extends BaseController {
  RxList<ImportantModel> importantQuestions = <ImportantModel>[].obs;
  bool get isImportantQuestionsLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.QUESTIONS);
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
                    message: 'تمت ازالة السؤال من الأسئلة المهمة',
                    messageType: MessageType.SUCCESS))));
  }

  addToImportants(int id) {
    runFutureFunctionWithLoading(
        function: ImportantRepository().addToImportants(questionID: id).then(
            (value) => value.fold(
                (l) => CustomToast.showMessage(message: l),
                (r) => CustomToast.showMessage(
                    message: 'تمت اضافة السؤال الى الأسئلة المهمة',
                    messageType: MessageType.SUCCESS))));
  }
}
