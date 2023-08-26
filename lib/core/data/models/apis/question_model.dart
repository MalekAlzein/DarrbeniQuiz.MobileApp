class QuestionModel {
  int id;
  String question;
  int answer;
  List<String> options;
  bool isAnswerCorrect;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.options,
    this.isAnswerCorrect = false,
  });
}
