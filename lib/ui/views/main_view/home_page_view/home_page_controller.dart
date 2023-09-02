import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

class HomePageController extends BaseController {
  List<String> collegeSubjects = [''].obs;
  RxList<String> bookQuestions = <String>[].obs;

  getBookQuestions({required collegeID}) {
    bookQuestions.clear();
    // runFutureFunctionWithLoading(
    // operationType: OperationType.QUESTION,
    //     function: QuestionsRepository()
    //         .getBookQuestions(collegeID: collegeID)
    //         .then((value) => value.fold(
    //             (l) => CustomToast.showMessage(message: l),
    //             (r) => bookQuestions.addAll(r))));
    // totalQuestions.value = bookQuestions.length;
  }

  getSubjectBookQuestions({required subjectID}) {
    bookQuestions.clear();
    // runLoadingFutureFunction(
    //     function: QuestionsRepository()
    //         .getSubjectBookQuestions(subjectID: subjectID)
    //         .then((value) => value.fold(
    //             (l) => CustomToast.showMessage(message: l),
    //             (r) => bookQuestions.addAll(r))));
    // totalQuestions.value = bookQuestions.length;
  }

  getLast5Exams({required specialID}) {
    // last5exams.clear();
    // runLoadingFutureFunction(
    //     operationType: OperationType.EXAMS,
    //     function: SpecializationRepository()
    //         .getLast5Exams(specialId: specialID)
    //         .then((value) => value.fold(
    //             (l) => CustomToast.showMessage(message: l),
    //             (r) => last5exams.value = r)));
  }

  void getExamWithDate({required specialID, required date}) async {
    bookQuestions.clear();
    // runLoadingFutureFunction(
    //     operationType: OperationType.QUESTION,
    //     function: SpecializationRepository()
    //         .getExamWithDate(uuid: specialID, date: date)
    //         .then((value) => value.fold(
    //             (l) => CustomToast.showMessage(message: l),
    //             (r) => {
    //                   bookQuestions.addAll(r),
    //                   totalQuestions.value = bookQuestions.length,
    //                   progressFactor.value =
    //                       '${currentQuestion.value + 1} / ${totalQuestions.value}',
    //                 })));
  }
}
