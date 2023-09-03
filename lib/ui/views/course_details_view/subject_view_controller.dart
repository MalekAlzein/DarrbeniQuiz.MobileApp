import 'package:flutter_templete/core/data/models/apis/question_model.dart';
import 'package:flutter_templete/core/data/reposotories/terms_and_book_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

import '../../../core/enums/operation_type.dart';
import '../../../core/enums/request_status.dart';
import '../../shared/custom_widgets/custom_toast.dart';

class SubjectViewController extends BaseController {
  List<String> collegeSubjects = [''].obs;
  RxList<QuestionModel> questions = <QuestionModel>[].obs;
  bool get isQuestionsLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.QUESTIONS);

  Future getBankQuestions({required specialid}) {
    return runFutureFunctionWithLoading(
        operationType: OperationType.QUESTIONS,
        function: QuestionSrepository()
            .getBankQuestions(specialID: specialid)
            .then((value) =>
                value.fold((l) => CustomToast.showMessage(message: l), (r) {
                  questions.clear();
                  questions.addAll(r);
                })));
  }

  Future getSubjectBookQuestions({required subjectID}) {
    return runFutureFunctionWithLoading(
        operationType: OperationType.QUESTIONS,
        function: QuestionSrepository()
            .getSubjectBookQuestions(subjectID: subjectID)
            .then((value) => value.fold(
                    (l) => CustomToast.showMessage(
                        message: l, messageType: MessageType.REJECTED), (r) {
                  questions.clear();
                  questions.addAll(r);
                })));
  }
}
