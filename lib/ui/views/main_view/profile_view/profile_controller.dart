import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/apis/profile_model.dart';
import 'package:flutter_templete/core/data/models/file_type_model.dart';
import 'package:flutter_templete/core/data/reposotories/profile_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_view.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  Rx<ProfileModel> myProfile = ProfileModel().obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<FileTypeModel> avatar = FileTypeModel().obs;
  RxBool isModified = false.obs;

  void getProfile() {
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
            storage.setProfile(r);
            myProfile.value = r;
            Get.to(() => const ProfileView());
            formKey.currentState!.save();
          });
        }),
      );
    }
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void pickAvatar() {
    showImagePickerBottomSheet(
      fileTypeModel: avatar.value,
      onSelected: (value) {
        if (avatar.value.path != value.path) isModified.value = true;
        avatar.value = value;
      },
    );
  }
}
