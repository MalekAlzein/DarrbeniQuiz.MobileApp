import 'package:flutter_templete/core/data/models/apis/question_model.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

class QuestionsController extends BaseController {
  // RxInt questionsCount = 0.obs;
  // RxDouble progress = 0.0.obs;
  // RxInt total = 0.obs;

  // void updateProgress() {
  //   var value = questionsCount.value / total.value;
  //   progress.value = value.clamp(0, 1);
  // }
  RxList<QuestionModel> questionsList = [
    QuestionModel(
      id: 1,
      question: "Best Channel for Flutter ",
      answer: 2,
      options: [
        'Sec it',
        'Sec it developer',
        'sec it developers',
        'mesh sec it '
      ],
    ),
    QuestionModel(
      id: 2,
      question: "Best State Mangment Ststem is ",
      answer: 1,
      options: ['BloC', 'GetX', 'Provider', 'riverPod'],
    ),
    QuestionModel(
      id: 3,
      question: "Best Flutter dev",
      answer: 2,
      options: ['sherif', 'sherif ahmed', 'ahmed sherif', 'doc sherif'],
    ),
    QuestionModel(
      id: 4,
      question: "Sherif is",
      answer: 1,
      options: ['eng', 'Doc', 'eng/Doc', 'Doc/Eng'],
    ),
    QuestionModel(
      id: 5,
      question: "Best Rapper in Egypt",
      answer: 3,
      options: ['Eljoker', 'Abyu', 'R3', 'All of the above'],
    ),
    QuestionModel(
      id: 6,
      question: "Real Name of ahmed sherif",
      answer: 2,
      options: ['ahmed sherif', 'sherif', 'Haytham', 'NONE OF ABOVE'],
    ),
    QuestionModel(
      id: 7,
      question: "Sherif love",
      answer: 3,
      options: ['Pharma', 'Micro', 'Medicnal', 'NONE OF ABOVE'],
    ),
    QuestionModel(
      id: 8,
      question: "hello",
      answer: 3,
      options: ['hello', 'hi', 'hola', 'Suiiiiiiiiiiii'],
    ),
    QuestionModel(
      id: 9,
      question: "Best Channel for Flutter ",
      answer: 2,
      options: [
        'Sec it',
        'Sec it developer',
        'sec it developers',
        'mesh sec it '
      ],
    ),
    QuestionModel(
      id: 10,
      question: "Best State Mangment Ststem is ",
      answer: 1,
      options: ['BloC', 'GetX', 'Provider', 'riverPod'],
    ),
  ].obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt score = 0.obs;

  void nextQuestion() {
    if (currentQuestionIndex.value < questionsList.length - 1) {
      currentQuestionIndex.value++;
    }
  }

  QuestionModel getCurrentQuestion() {
    if (currentQuestionIndex.value < questionsList.length) {
      return questionsList[currentQuestionIndex.value];
    }
    return QuestionModel(id: 0, question: '', answer: 0, options: []);
  }

  void checkAnswer(int selectedOption) {
    if (selectedOption == getCurrentQuestion().answer) {
      score.value++;
    }
  }

  int getScore() {
    return score.value;
  }
}
