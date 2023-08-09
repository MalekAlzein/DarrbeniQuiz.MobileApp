import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/base_controller.dart';

class LoginController extends BaseController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController enterCodeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // void login() {
  //   if (formKey.currentState!.validate()) {
  //     runFutureFunctionWithFullLoading(
  //         function: UserRepository()
  //             .login(
  //                 email: usernameController.text,
  //                 password: enterCodeController.text)
  //             .then((value) {
  //       value.fold((l) {
  //         isLoading.value = false;
  //         CustomToast.showMessage(
  //             messageType: MessageType.REJECTED, message: l);
  //       }, (r) {
  //         storage.setTokenInfo(r);
  //         Get.off(() => const MainView());
  //         formKey.currentState!.save();
  //       });
  //     }));
  //   }
  // }
}
