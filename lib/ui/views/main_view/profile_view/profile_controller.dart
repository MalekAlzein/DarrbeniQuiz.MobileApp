import 'package:get/get.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_toast.dart';
import 'package:new_quiz/UI/views/login_view/login_view.dart';
import 'package:new_quiz/core/data/repositories/profile_repository.dart';
import 'package:new_quiz/core/services/base_controller.dart';

import '../../../../core/enums/message_type.dart';

class profileController extends BaseController {
  RxString name = "".obs;
  RxInt phone = 0.obs;

  void onInit() {
    // TODO: implement onInit
    getUserInfo();
    super.onInit();
  }

  void getUserInfo() {
    profileRepository().showProfile().then((value) {
      value.fold((l) {
        customToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {
name.value=r.data!.username!;
phone.value=r.data!.phone!;

      });
    });
  }

  Future<void> logout() async {
      runFullLoadingFunction(
          function: profileRepository()
              .logout()
              .then((value) {
            value.fold((l) {
              customToast.showMessage(
                  message: l, messageType: MessageType.REJECTED);
            }, (r) {
              customToast.showMessage(message: r.message??"", messageType: MessageType.SUCCESS );
              Get.off(loginView(name: "aya"), transition: Transition.cupertino);
            });
          }));

  }

}