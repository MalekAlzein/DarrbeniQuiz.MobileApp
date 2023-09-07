import '../network_config.dart';

class TermsEndpoints {
  static String Terms = NetworkConfig.getFullApiRoute('terms/specialization/');
  static String TermsRest = '/getall';
  static String allTerms = NetworkConfig.getFullApiRoute('terms/getall');
}
