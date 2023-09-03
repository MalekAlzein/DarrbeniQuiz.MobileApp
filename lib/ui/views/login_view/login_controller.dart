import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/auth_repositories.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

import '../../../core/data/reposotories/profile_repository.dart';

class LoginController extends BaseController {
  RxBool loader = false.obs;
  TextEditingController userNameController =
      TextEditingController(text: kDebugMode ? "Shams" : "");
  TextEditingController codeController =
      TextEditingController(text: kDebugMode ? "634PuI" : "");
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  void login() {
    if (formKey1.currentState!.validate()) {
      runFutureFunctionWithFullLoading(
          function: AuthRepositories()
              .login(
                  name: userNameController.text, loginCode: codeController.text)
              .then((value) {
        value.fold((l) {
          loader.value = true;
          CustomToast.showMessage(
              messageType: MessageType.REJECTED, message: l);
        }, (r) {
          storage.setTokenInfo(r);
          Get.off(MainView());
          getUserInfo();
          formKey1.currentState!.save();
        });
      }));
    }
  }

  void getUserInfo() {
    runFutureFunctionWithFullLoading(
        function: ProfileRepository().getProfileInfo().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        storage.setProfileInfo(r);
      });
    }));
  }
}
