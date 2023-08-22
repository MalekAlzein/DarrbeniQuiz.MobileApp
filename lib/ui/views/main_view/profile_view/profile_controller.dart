import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/apis/profile_model.dart';
import 'package:flutter_templete/core/data/reposotories/profile_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_view.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  RxList<ProfileModel> myProfileList = <ProfileModel>[].obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    myProfile();
    super.onInit();
  }

  void myProfile() {
    if (formKey.currentState!.validate()) {
      runFutureFunctionWithFullLoading(
        function: ProfileRepository().myProfile().then((value) {
          value.fold((l) {
            // isLoading.value = false;
            CustomToast.showMessage(
              messageType: MessageType.REJECTED,
              message: l,
            );
          }, (r) {
            myProfileList.addAll(r);
            Get.to(() => const ProfileView());
            formKey.currentState!.save();
          });
        }),
      );
    }
  }
}
