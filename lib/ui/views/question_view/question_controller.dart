import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:get/get.dart';
import '../../../core/data/models/apis/question_model.dart';
import '../../../core/enums/Operation_type.dart';
import '../../../core/enums/request_status.dart';
import '../../../core/services/base_controller.dart';

class QuestionsController extends BaseController {
  QuestionsController(this.questions);
  late List<QuestionModel> questions;

  bool get isQuestionLoading {
    update();
    return requestStatus.value == RequestStatus.LOADING &&
        operationTypeList.contains(OperationType.QUESTIONS);
  }

  RxBool isShimmerLoader = true.obs;
  RxBool showResult = false.obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt correctAnswers = 0.obs;
  RxInt erroranswer = 0.obs;
  RxDouble spinnerValue = 0.0.obs;
  RxList selectedAnswers = [].obs;
  RxList showAnswer = [].obs;
  RxList isCorrectAnswer = [].obs;
  RxList isImportantQuestion = [].obs;

  @override
  void onReady() {}

  void onInit() {
    Future.delayed(Duration(seconds: 3), () {
      isShimmerLoader.value = false;
      update();
    });
    super.onReady();
    selectedAnswers.value = List.filled(questions.length, -1).obs;
    showAnswer.value = List.filled(questions.length, -1).obs;
    isCorrectAnswer.value = List.filled(questions.length, false).obs;
    importanceService.setcurrentQuestion =
        questions.isNotEmpty ? questions[0] : QuestionModel();
    super.onInit();
  }

  void selectAnswer(int answerId) {
    selectedAnswers[currentQuestionIndex.value] = answerId;
    update();
  }

  void shownAnswer(int answerId) {
    showAnswer[currentQuestionIndex.value] = answerId;
    update();
  }

  void isCorrect(bool iscorret) {
    isCorrectAnswer[currentQuestionIndex.value] = iscorret;
    update();
  }

  void nextQuestion() {
    if ((correctAnswers.value + erroranswer.value) !=
        currentQuestionIndex.value) {
      correctAnswers.value = currentQuestionIndex.value - erroranswer.value;
    }

    currentQuestionIndex.value++;
    importanceService.setcurrentQuestion =
        questions[currentQuestionIndex.value];

    update();
  }

  void backQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
      importanceService.setcurrentQuestion =
          questions[currentQuestionIndex.value];
    }
    update();
  }

  void incresSlider() {
    if (spinnerValue.value < 1)
      spinnerValue.value = (spinnerValue.value + 0.01);
    update();
  }
}
