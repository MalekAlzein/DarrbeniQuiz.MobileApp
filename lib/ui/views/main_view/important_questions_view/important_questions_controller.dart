import 'package:flutter_templete/core/data/models/apis/question_model.dart';
import 'package:flutter_templete/core/data/reposotories/important_questions_repository.dart';
import 'package:flutter_templete/core/data/reposotories/terms_and_book_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:get/get.dart';

import '../../../../core/enums/operation_type.dart';
import '../../../shared/custom_widgets/custom_toast.dart';

class ImportantQuestionsController extends BaseController {
  RxList<QuestionModel> importantQuestions = <QuestionModel>[].obs;

  bool get isImportantQuestionsLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.QUESTIONS);
  RxInt selectedAnswer = (-1).obs;
  // Rx<QuestionModel> currentQuestion = QuestionModel().obs;

  @override
  void onInit() {
    getImportantQuestions();
    importanceService.currentQuestion.value =
        importantQuestions.isNotEmpty ? importantQuestions[0] : QuestionModel();
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

  toggleQuestionImportance(int id) {
    if (importanceService.currentQuestion.value.isImportant!) {
      removeFromImportants(id);
    } else
      addToImportants(id);
  }

  Future removeFromImportants(int id) {
    return runFutureFunctionWithLoading(
        function: ImportantRepository()
            .removeFromImportants(questionID: id)
            .then((value) =>
                value.fold((l) => CustomToast.showMessage(message: l), (r) {
                  CustomToast.showMessage(
                      message: tr("key_important_removed"),
                      messageType: MessageType.SUCCESS);
                  getImportantQuestions();
                  getSingleQuestion(id);
                })));
  }

  Future addToImportants(int id) {
    return runFutureFunctionWithLoading(
        function: ImportantRepository().addToImportants(questionID: id).then(
            (value) =>
                value.fold((l) => CustomToast.showMessage(message: l), (r) {
                  CustomToast.showMessage(
                      message: tr("key_important_added"),
                      messageType: MessageType.SUCCESS);
                  getImportantQuestions();
                  getSingleQuestion(id);
                })));
  }

  Future getSingleQuestion(int id) {
    return runFutureFunctionWithLoading(
        function: QuestionSrepository()
            .getSingleQuestion(questionID: id)
            .then((value) => value.fold(
                (l) => CustomToast.showMessage(message: l),
                (r) => {
                      importanceService.currentQuestion.value = r,
                      update(),
                    })));
  }
}
