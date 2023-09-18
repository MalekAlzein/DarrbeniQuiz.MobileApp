import 'package:flutter_templete/core/data/models/notification_model.dart';
import 'package:flutter_templete/core/data/reposotories/notifications_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class NotificationsController extends BaseController {

  Rx<NotificationModel> notificationsModel = NotificationModel().obs;

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }

  void getNotifications() {
    runFutureFunctionWithLoading(
        function: NotificationsRepository().getNotifications().then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l , messageType: MessageType.REJECTED);
          }, (r) {
            notificationsModel.value = r;
          });
        })
    );
  }

}
