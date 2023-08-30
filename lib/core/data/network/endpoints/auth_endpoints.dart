import 'package:flutter_templete/core/data/network/network_config.dart';

class AuthEndpoints {
  static String register = NetworkConfig.getFullApiRoute('/register');
  static String login = NetworkConfig.getFullApiRoute('/login');
  static String logout = NetworkConfig.getFullApiRoute('/logout');
}
