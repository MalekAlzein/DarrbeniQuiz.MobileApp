import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/auth_repositories.dart';
import 'package:flutter_templete/core/data/reposotories/colleges_and_specializtions_repositories.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';

class RegisterController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxInt collegeId = 0.obs;
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String code = '';
  RxBool isloading = true.obs;
  RxBool returnSent = false.obs;
  List specializationList = [];
  @override
  onInit() {
    getAllSpecializtions();
    super.onInit();
  }

  void register() {
    if (formKey.currentState!.validate() && collegeId != 0) {
      runFutureFunctionWithFullLoading(
          function: AuthRepositories.register(
        speci_id: collegeId.value,
        name: userController.text,
        phone: phoneController.text,
      ).then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          Get.offAll(() => LoginView());
        });
      }));
    } else if (collegeId == 0) {
      CustomToast.showMessage(
          message: "الرجاء اختيار الاختصاص", messageType: MessageType.REJECTED);
    }
  }

  Future getAllSpecializtions() async {
    await CollegesAndSpecializtionsRepositories.getAllSpecializtions()
        .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
        returnSent.value = true;
      }, (r) {
        for (var specializtion in r) {
          specializationList
              .add([specializtion.specializationName, specializtion.id]);
        }
        isloading.value = false;
      });
    });
  }
}
