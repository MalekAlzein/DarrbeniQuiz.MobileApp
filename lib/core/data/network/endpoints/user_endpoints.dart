import '../network_config.dart';

class UserEndpoints {
  static String login = NetworkConfig.getFullApiRoute('auth/login');
  static String register = NetworkConfig.getFullApiRoute('auth/register');
}
