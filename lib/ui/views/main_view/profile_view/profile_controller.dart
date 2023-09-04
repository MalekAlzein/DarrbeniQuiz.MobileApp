import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/views/splash_screen/spalsh_screen_view.dart';
import 'package:get/get.dart';

import '../../../../core/data/reposotories/profile_repository.dart';
import '../../../../core/enums/message_type.dart';
import '../../../../core/services/base_controller.dart';
import '../../../shared/custom_widgets/custom_toast.dart';

class ProfileController extends BaseController {
  RxString name = "".obs;
  RxInt phone = 0.obs;
  RxBool loader = false.obs;

  void onInit() {
    // TODO: implement onInit
    getInfo();
    super.onInit();
  }

  void getInfo() {
    name.value = storage.getProfileInfo()!.name!;
    phone.value = storage.getProfileInfo()!.mobilePhone!;
  }

  Future<void> logout() async {
    runFutureFunctionWithFullLoading(
        function: ProfileRepository().logout().then((value) {
      value.fold((l) {
        loader.value = true;
        CustomToast.showMessage(messageType: MessageType.REJECTED, message: l);
      }, (r) {
        storage.clearTokenInfo();
        Get.off(() => SplashScreenView());
      });
    }));
  }
}
