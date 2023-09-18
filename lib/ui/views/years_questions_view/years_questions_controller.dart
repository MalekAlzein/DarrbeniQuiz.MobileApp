import 'package:flutter_templete/core/data/models/apis/terms_model.dart';
import 'package:get/get.dart';

import '../../../core/data/reposotories/terms_repositories.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/enums/terms_type.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../question_view/question_view.dart';

class YearsQuestionsController extends BaseController {
  YearsQuestionsController({
    required int subjectId,
    required TermsType termsType,
  }) {
    this.subjectId.value = subjectId;
    this.termsType.value = termsType;
  }
  RxList<TermsModel> yearsQuestionsList = <TermsModel>[].obs;
  Rx<TermsType> termsType = TermsType.SINGLE_SUBJECT.obs;
  RxInt subjectId = 0.obs;
  @override
  void onInit() {
    getQuestionsName();
    super.onInit();
  }

  void getQuestionsName() {
    if (termsType == TermsType.SINGLE_SUBJECT) {
      runFutureFunctionWithLoading(
          function: TermsRepositories.getTermsName(subjectId: subjectId.value)
              .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          yearsQuestionsList.addAll(r);
        });
      }));
    } else {
      runFutureFunctionWithLoading(
          function: TermsRepositories.getAllTermsName().then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          yearsQuestionsList.addAll(r);
        });
      }));
    }
  }

  void getQuestions({required int termId}) {
    if (termsType == TermsType.SINGLE_SUBJECT) {
      runFutureFunctionWithFullLoading(
          function: TermsRepositories.getYearQuestions(
                  termId: termId, subjectId: subjectId.value)
              .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: "خطأ, حاول مجددا", messageType: MessageType.REJECTED);
        }, (r) {
          Get.off(QuestionView(questions: r));
        });
      }));
    } else {
      runFutureFunctionWithFullLoading(
          function: TermsRepositories.getAllYearQuestions(termId: termId)
              .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: "خطأ, حاول مجددا", messageType: MessageType.REJECTED);
        }, (r) {
          Get.off(QuestionView(questions: r));
        });
      }));
    }
  }
}
