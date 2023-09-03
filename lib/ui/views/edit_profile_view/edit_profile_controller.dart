import 'package:flutter/cupertino.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_view.dart';
import 'package:get/get.dart';

import '../../../core/data/reposotories/profile_repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/services/base_controller.dart';
import '../../../core/utils/general_utils.dart';
import '../../shared/custom_widgets/custom_toast.dart';

class EditProfileController extends BaseController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool loader = false.obs;

  EditProfileController(String userName, int phone) {
    userNameController.text = userName;
    phoneController.text = phone.toString();
  }

  Future<void> editProfileInfo() async {
    runFutureFunctionWithFullLoading(
        function: ProfileRepository()
            .updateProfileInfo(
                name: userNameController.text, phone: phoneController.text)
            .then((value) {
      value.fold((l) {
        loader.value = true;
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        getUserInfo();
      });
    }));
  }

  Future<void> getUserInfo() async {
    runFutureFunctionWithFullLoading(
        function: ProfileRepository().getProfileInfo().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        storage.setProfileInfo(r);
        Get.to(ProfileView());
      });
    }));
  }
}
