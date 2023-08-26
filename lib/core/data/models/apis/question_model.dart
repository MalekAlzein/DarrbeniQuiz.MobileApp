class QuestionModel {
  final int id;
  final String question;
  final int answer;
  final List<String> options;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.options,
  });
}
