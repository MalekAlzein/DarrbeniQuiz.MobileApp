import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_view.dart';
import 'package:get/get.dart';
import '../../../../core/data/reposotories/profile_repository.dart';
import '../../../../core/enums/message_type.dart';
import '../../../../core/services/base_controller.dart';
import '../../../shared/custom_widgets/custom_toast.dart';

class ProfileController extends BaseController {
  RxString name = "".obs;
  RxInt phone = 0.obs;

  void onInit() {
    // TODO: implement onInit
    getUserInfo();
    super.onInit();
  }

  void getUserInfo() {
    ProfileRepository().getProfileInfo().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        name.value = r.data!.name!;
        phone.value = r.data!.mobilePhone!;
      });
    });
  }

  Future<void> logout() async {
    runFutureFunction(
        function: ProfileRepository().logout().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        storage.clearTokenInfo();
        CustomToast.showMessage(
            message: "loggedout succesfully" ?? "", messageType: MessageType.SUCCESS);
        Get.off(ProfileView());
      });
    }));
  }
}
