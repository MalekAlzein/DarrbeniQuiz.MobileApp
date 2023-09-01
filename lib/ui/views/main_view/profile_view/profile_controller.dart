import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:get/get.dart';
import '../../../../core/data/reposotories/profile_repository.dart';
import '../../../../core/enums/message_type.dart';
import '../../../../core/services/base_controller.dart';
import '../../../shared/custom_widgets/custom_toast.dart';

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
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        name.value = r.data!.name!;
        phone.value = r.data!.mobilePhone!;
      });
    });
  }

  Future<void> logout() async {
    runFutureFunction(
        function: profileRepository().logout().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        storage.clearTokenInfo();
        CustomToast.showMessage(
            message: r ?? "", messageType: MessageType.SUCCESS);
      });
    }));
  }
}
