import 'package:flutter_templete/core/data/models/apis/question_model.dart';
import 'package:get/get.dart';

class ImportanceService {
  Rx<QuestionModel> currentQuestion = QuestionModel().obs;
  set setcurrentQuestion(QuestionModel question) =>
      currentQuestion.value = question;
}
