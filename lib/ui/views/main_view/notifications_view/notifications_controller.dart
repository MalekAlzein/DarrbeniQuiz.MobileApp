import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:get/get.dart';

class NotificationsController extends BaseController {
  RxBool enableNotification = false.obs;

  @override
  void onInit() {
    if (storage.getFcmToken() == '') {
      enableNotification.value = false;
    } else {
      enableNotification.value = true;
    }
    super.onInit();
  }

  void toggleNotification() {
    enableNotification.value = !enableNotification.value;
    notificationService.toggleNotification(enableNotification.value);
  }


}
