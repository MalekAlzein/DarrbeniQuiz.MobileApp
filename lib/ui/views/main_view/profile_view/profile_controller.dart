import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/apis/profile_model.dart';
import 'package:flutter_templete/core/data/reposotories/profile_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  Rx<ProfileModel> myProfile = ProfileModel().obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void getProfile() {
    runFutureFunctionWithFullLoading(
      function: ProfileRepository().myProfile().then((value) {
        value.fold((l) {
          // isLoading.value = false;
          CustomToast.showMessage(
            messageType: MessageType.REJECTED,
            message: l,
          );
        }, (r) {
          storage.setProfile(r);
          myProfile.value = r;
          // Get.to(() => const ProfileView());
        });
      }),
    );
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
