import 'package:flutter_templete/app/my_app_controller.dart';
import 'package:flutter_templete/core/data/reposotories/shared_prefernces.dart';
import 'package:flutter_templete/core/enums/connectivity_status.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/cart_services.dart';
import 'package:flutter_templete/core/services/connectivity_service.dart';
import 'package:flutter_templete/core/services/location_service.dart';
import 'package:flutter_templete/core/services/notification_service.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

ConnectivityService get connectivityService => Get.find<ConnectivityService>();

SharedPrefrenceRepostory get storage => Get.find<SharedPrefrenceRepostory>();
CartService get cartService => Get.find<CartService>();
LocationService get locationService => Get.find<LocationService>();
NotificationService get notificationService => Get.find<NotificationService>();
// get get.size.width();
Future claunchUrl(Uri url) async {
  if (!await launchUrl(
    url,
    // mode: LaunchMode.externalApplication,
  )) {
    CustomToast.showMessage(
        message: 'cant launch url', messageType: MessageType.REJECTED);
  }
}

double get taxAmount => 0.18;
double get deliverAmount => 0.1;
//when value change change
bool get isOnline =>
    Get.find<MyAppController>().connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    Get.find<MyAppController>().connectivityStatus ==
    ConnectivityStatus.OFFLINE;
//return note
//func bool and  toast
void checkConnection(Function function) {
  if (isOnline)
    //easy
    function();
  else
    showNoConnectionMessage();
}

void showNoConnectionMessage() {
  CustomToast.showMessage(
      message: 'Please check internet connection',
      messageType: MessageType.WARNING);
}
