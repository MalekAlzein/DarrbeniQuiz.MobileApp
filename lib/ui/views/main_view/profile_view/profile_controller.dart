import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/views/login_view/login_view.dart';
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
    getUserInfo();
    super.onInit();
  }

  void getUserInfo() {
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
        Get.off(LoginView());
      });
    }));
  }
}
