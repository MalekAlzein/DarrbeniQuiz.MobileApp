import '../network_config.dart';

class AuthEndpoints {
  static String login = NetworkConfig.getFullApiRoute('auth/login');
  static String register = NetworkConfig.getFullApiRoute('auth/register');
}
