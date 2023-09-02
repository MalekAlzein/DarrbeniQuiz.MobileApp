import '../network_config.dart';

class SpecializationEndpoints {
  static String searchCollages =
      NetworkConfig.getFullApiRoute('Specialization/search');
  static String allCollages = NetworkConfig.getFullApiRoute('Collages/all');
  static String allSpecialization =
      NetworkConfig.getFullApiRoute('Specialization/allSpecialization');
  static String showMaster =
      NetworkConfig.getFullApiRoute('Specialization/filters/type/master');
  static String showGraduation =
      NetworkConfig.getFullApiRoute('Specialization/filters/type/graduation');
  static String showSubject =
      NetworkConfig.getFullApiRoute('Specialization/filters/specialization/');
}
