import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/auth_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';

class SignupController extends BaseController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController specializationIdController = TextEditingController();
  RxInt collegeId = (-1).obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxInt selectedValue = (-1).obs;

  void register() {
    if (formKey.currentState!.validate()) {
      runFutureFunctionWithFullLoading(
        function: AuthRepository()
            .register(
          name: usernameController.text,
          phone: mobileController.text,
          collegeId: collegeId.value,
        )
            .then(
          (value) {
            value.fold((l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            }, (r) {
              CustomToast.showMessage(
                message: 'everything ok',
                messageType: MessageType.SUCCESS,
              );
              Get.off(() => LoginView());
            });
          },
        ),
      );
    }
  }
}
