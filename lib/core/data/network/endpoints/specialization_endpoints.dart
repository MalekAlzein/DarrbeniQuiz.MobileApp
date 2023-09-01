import '../network_config.dart';

class SpecializationEndpoints {
  static String searchCollages =
      NetworkConfig.getFullApiRoute('Specialization/search');
  static String allCollages = NetworkConfig.getFullApiRoute('Collages/all');
  static String allSpecialization =
      NetworkConfig.getFullApiRoute('Specialization/allSpecialization');
  static String moreOptions =
      NetworkConfig.getFullApiRoute('Specialization/checkButtons');
  static String ShowMaster =
      NetworkConfig.getFullApiRoute('Specialization/filters/type/master');
}
