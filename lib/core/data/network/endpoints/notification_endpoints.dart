import 'package:flutter_templete/core/data/network/network_config.dart';

class EndpoinNotifictionts {
  static String notifictionUpdate =
      NetworkConfig.getFullApiRoute('dashboard/Notification/update');
  static String getAllNotifiction =
      NetworkConfig.getFullApiRoute('dashboard/Notification/getall');
}
