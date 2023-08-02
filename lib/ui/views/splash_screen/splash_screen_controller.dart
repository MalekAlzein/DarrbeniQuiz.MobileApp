import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';

import 'package:get/get.dart';

import '../../shared/utils.dart';

class SplashSceenController extends GetxController {
  @override
  void onInit() {
    // Future.delayed(Duration(seconds: 2)).then((value) {
    //   if (storage.getFirstLunch())
    //     Get.off(IntroView());
    //   //to off back
    //   else
    //     Get.off(
    //       storage.isLoggedIn ? MainView() : LandingView(),
    //     );
    //   storage.setFirstLunch(false);
    //   if (storage.getSubStatus()) {
    //     Get.off(LandingView());
    //   } else {
    //     CustomToast.showMessage(
    //         message: "Your Sub expired", messageType: MessageType.WARNING);
    //   }
    // });
    super.onInit();
  }
}
