class QuestionModel {
  final String questionText;
  final List<String> options;
  final int correctAnswerId;

  QuestionModel(
      {required this.questionText,
      required this.options,
      required this.correctAnswerId});
}
