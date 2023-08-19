import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SignupController extends BaseController {
  RxBool isLoding = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController specializationIdController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void SignUp() {
    if (formKey.currentState!.validate()) {
      isLoding.value = true;
      CustomToast.showMessage(
          message: 'every thing ok', messageType: MessageType.SUCCESS);
    }
    UserRepository()
        .register(
      name: usernameController.text,
      mobilePhone: mobileController.text,
      specializationId: specializationIdController.text,
    )
        .then((value) {
      value.fold((l) {
        isLoding.value = false;
        CustomToast.showMessage(messageType: MessageType.REJECTED, message: l);
      }, (r) {
        Get.off(MainView());
      });
    });
  }
}
