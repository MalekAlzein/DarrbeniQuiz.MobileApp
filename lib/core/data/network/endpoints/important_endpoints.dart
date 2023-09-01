import '../network_config.dart';

class ImportanceEndpoints {
  static String addImportance = NetworkConfig.getFullApiRoute(
      'ImportanceQuestions/addQuestion/question/');
  static String getImportance =
      NetworkConfig.getFullApiRoute('ImportanceQuestions/getImportances');
  static String deleteImportance =
      NetworkConfig.getFullApiRoute('ImportanceQuestions/remove/question/');
}
