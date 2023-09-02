import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/data/reposotories/profile_repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../main_view/profile_view/Profile_view.dart';

class EditProfileController extends BaseController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EditProfileController(String userName, int phone) {
    userNameController.text = userName;
    phoneController.text = phone.toString();
  }

  Future<void> editProfileInfo() async {
    runFutureFunction(
        function: ProfileRepository().updateProfileInfo().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(
            message: "updated succesfully" ?? "", messageType: MessageType.SUCCESS);
        Get.off(ProfileView());
      });
    }));
  }
}
