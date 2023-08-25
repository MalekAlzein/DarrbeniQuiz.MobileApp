import 'package:flutter_templete/core/data/network/network_config.dart';

class ProfileEndpoints {
  static String myProfile = NetworkConfig.getFullApiRoute('/my-profile');
  static String updateProfile =
      NetworkConfig.getFullApiRoute('/profile/update');
  static String updatePhoto =
      NetworkConfig.getFullApiRoute('/profile/update-photo');
}
