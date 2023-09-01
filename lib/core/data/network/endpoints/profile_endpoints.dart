import '../network_config.dart';

class ProfileEndpoints {
  static String profileInfo = NetworkConfig.getFullApiRoute('UserProfile/Info');
  static String profileUpdate =
      NetworkConfig.getFullApiRoute('UserProfile/update');
  static String feedBack = NetworkConfig.getFullApiRoute('serProfile/Feedback');
  static String logout =
      NetworkConfig.getFullApiRoute('auth/UserProfile/logout');
  static String aboutUs = NetworkConfig.getFullApiRoute('aboutus/get');
}
