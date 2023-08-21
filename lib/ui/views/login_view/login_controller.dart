import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/auth_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  TextEditingController usernameController =
      TextEditingController(text: "shams");
  TextEditingController enterCodeController =
      TextEditingController(text: "d0rdwSTeIO");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState!.validate()) {
      runFutureFunctionWithFullLoading(
        function: AuthRepository()
            .login(
          name: usernameController.text,
          code: enterCodeController.text,
        )
            .then((value) {
          value.fold((l) {
            // isLoading.value = false;
            CustomToast.showMessage(
              messageType: MessageType.REJECTED,
              message: l,
            );
          }, (r) {
            storage.setTokenInfo(r);
            Get.off(() => const MainView());
            formKey.currentState!.save();
          });
        }),
      );
    }
  }
}
