import '../network_config.dart';

class QuestionEndpoints {
  static String bookQueston =
      NetworkConfig.getFullApiRoute('Books/Questions/Subject/');
  static String bankQuestions =
      NetworkConfig.getFullApiRoute('BankQuestions/specialization/');
  static String specializationTermsQuestions =
      NetworkConfig.getFullApiRoute('SpecializationTermsQuestions/term/');
  static String questionByTermOfSubject =
      NetworkConfig.getFullApiRoute('Questions/Terms/term_id/');
  static String SubjectByTerm = '/Subjects/subject_id/';
}
