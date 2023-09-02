import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:get/get.dart';

// class SplashScreenController extends BaseController {
//   @override
//   void onInit() {
//     Future.delayed(Duration(seconds: 6)).then((value) {
//       if (storage.getFirstLogin()) {
//         Get.off(loginView());
//       } else {
//         Get.off(storage.isLoggedIn ? MainView() : LandingView());
//       }
//       storage.setFirstLogin(false);
//     });
//     super.onInit();
//   }
// }
