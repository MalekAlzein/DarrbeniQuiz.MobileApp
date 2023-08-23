import 'package:flutter_templete/core/data/reposotories/college_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
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
    // RxBool isLoding = false.obs;
    Future.delayed(Duration(seconds: 4)).then((value) async {
      {
        getCollege();
        // Get.off(() => LoginView());
        super.onInit();
      }
    });
  }

  void getCollege() {
    CollegeRepository().getAllColleges().then((value) {
      value.fold((l) {
        // isLoding.value = false;
        CustomToast.showMessage(
          messageType: MessageType.REJECTED,
          message: l,
        );
      }, (r) {
        storage.setCollege(r);
        Get.off(() => LoginView());
      });
    });
  }
}
