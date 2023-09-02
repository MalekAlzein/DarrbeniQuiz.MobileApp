import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/auth_repositories.dart';
import 'package:flutter_templete/core/data/reposotories/colleges_and_specializtions_repositories.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class RegisterController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxInt colegeId = 0.obs;
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String code = '';
  RxBool isloading = true.obs;
  List specializationList = [];
  @override
  onInit() {
    isloading.value = true;
    getAllSpecializtions();
    super.onInit();
  }

  void register() {
    if (formKey.currentState!.validate()) {
      runFutureFunctionWithFullLoading(
          function: AuthRepositories.register(
        speci_id: colegeId.value,
        name: userController.text,
        phone: phoneController.text,
      ).then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          //!  if Check this code you need to uncomment the line below --**-- 
          // Get.to(() => LoginView());
        });
      }));
    } else {}
  }

  Future getAllSpecializtions() async {
    await CollegesAndSpecializtionsRepositories.getAllSpecializtions()
        .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
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
