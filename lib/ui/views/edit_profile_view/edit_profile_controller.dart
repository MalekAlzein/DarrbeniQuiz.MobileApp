import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/apis/profile_model.dart';
import 'package:flutter_templete/core/data/reposotories/profile_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class EditProfileController extends BaseController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<ProfileModel> myProfile = ProfileModel().obs;

  void updateProfile() {
    // if (formKey.currentState!.validate()) {

    runFutureFunctionWithFullLoading(
      function: ProfileRepository()
          .updateProfile(
        name: usernameController.text,
        phone: mobileController.text,
      )
          .then((value) {
        value.fold((l) {
          // isLoading.value = false;
          CustomToast.showMessage(
            messageType: MessageType.REJECTED,
            message: l,
          );
        }, (r) {
          myProfile.value = r;
          Get.back();
          // formKey.currentState!.save();
        });
      }),
    );
    // }
  }

  bool isModified() {
    return usernameController.text == myProfile.value.name &&
        mobileController.text == myProfile.value.phone;
  }

  @override
  void onInit() {
    myProfile.value = storage.getProfile()!;
    super.onInit();
  }

  @override
  void onReady() {
    usernameController.text = myProfile.value.name ?? '';
    mobileController.text = myProfile.value.phone ?? '';
    super.onReady();
  }
}
