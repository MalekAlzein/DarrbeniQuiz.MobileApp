import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/apis/question_model.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:get/get.dart';

class QuestionsController extends BaseController {
  RxInt questionsCount = 0.obs;
  RxDouble progress = 0.0.obs;
  RxInt total = 0.obs;

  void updateProgress() {
    var value = questionsCount.value / total.value;
    progress.value = value.clamp(0, 1);
  }
//?--questions---

  final List<QuestionModel> questions = [
    QuestionModel(
      questionText:
          'ما هو الفرق بين Stateful Widget و Stateless Widget في Flutter؟',
      options: [
        'لا يوجد فرق',
        'Stateful Widget له حالة بينما Stateless Widget ليس له',
        'Stateless Widget له حالة بينما Stateful Widget ليس له',
      ],
      correctAnswerId: 1,
    ),
    QuestionModel(
      questionText: 'ما هي الطريقة المستخدمة لإدارة الحالة في Flutter?',
      options: [
        'setState',
        'ChangeNotifier',
        'update',
        'refresh',
      ],
      correctAnswerId: 0,
    ),
    QuestionModel(
      questionText: 'ما هو الفرق بين var و final و const في Dart?',
      options: [
        'لا فرق بينهم',
        'final لا يمكن تغييره بينما const ثابت',
        'const لا يمكن تغييره بينما final ثابت',
        'var و final متغيران بينما const ثابت',
      ],
      correctAnswerId: 1,
    ),
    QuestionModel(
      questionText:
          'ما هو الفرق بين Stateful Widget و Stateless Widget في Flutter؟',
      options: [
        'لا يوجد فرق',
        'Stateful Widget له حالة بينما Stateless Widget ليس له',
        'Stateless Widget له حالة بينما Stateful Widget ليس له',
      ],
      correctAnswerId: 1,
    ),
    QuestionModel(
      questionText: 'ما هي الطريقة المستخدمة لإدارة الحالة في Flutter?',
      options: [
        'setState',
        'ChangeNotifier',
        'update',
        'refresh',
      ],
      correctAnswerId: 0,
    ),
    QuestionModel(
      questionText: 'ما هو الفرق بين var و final و const في Dart?',
      options: [
        'لا فرق بينهم',
        'final لا يمكن تغييره بينما const ثابت',
        'const لا يمكن تغييره بينما final ثابت',
        'var و final متغيران بينما const ثابت',
      ],
      correctAnswerId: 1,
    ),
  ];

  RxInt currentQuestionIndex = 0.obs;
  RxInt totalScore = 0.obs;
  List<int> userAnswers = [];
  int currentAnswer = 0;
  String? imageAnswer;
  Color? colorAnswer;

  QuestionModel getCurrentQuestion() {
    return questions[currentQuestionIndex.value];
  }

  void selectAnswer(int answerIndex) {
    userAnswers.add(answerIndex);
  }

  void setAnswer(int answer) {
    currentAnswer = answer;
  }

  void checkAnswers() {
    int score = 0;

    questions.asMap().forEach((index, question) {
      if (userAnswers[index] == question.correctAnswerId) {
        score++;
        colorAnswer = AppColors.mainBlueColor;
        imageAnswer = "assets/svgs/ic_answer_correct.svg";
      } else {
        colorAnswer = AppColors.mainRedColor;
        imageAnswer = "assets/svgs/ic_answer_wrong.svg";
      }
    });

    totalScore.value = score;

    update();
  }

  void nextQuestion() {
    currentQuestionIndex++;

    if (currentQuestionIndex.value >= questions.length) {
      checkAnswers();
      currentQuestionIndex.value = 0;
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex--;
    }
  }

  void restartTest() {
    currentQuestionIndex.value = 0;
    userAnswers.clear();
    totalScore.value = 0;
  }

  String? getImageAnswer() {
    return imageAnswer;
  }

  Color? getAnswerColor() {
    return colorAnswer;
  }
}
