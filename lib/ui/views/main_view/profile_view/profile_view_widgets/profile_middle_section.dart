import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_subtitle_container.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/about_us_view/about_us_view.dart';
import 'package:flutter_templete/ui/views/edit_profile_view/edit_profile_view.dart';
import 'package:flutter_templete/ui/views/send_feedback/send_feedback.dart';
import 'package:get/get.dart';

class ProfileMiddleSectionWidget extends StatelessWidget {
  const ProfileMiddleSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSubTitleContainer(
          text: tr("key_personal_info"),
          imageName: "ic_edit",
          onTap: () {
            Get.to(() => const EditProfileView());
          },
        ),
        screenHeight(45).ph,
        CustomSubTitleContainer(
          text: tr("key_send_feedback"),
          imageName: "ic_send_feedback",
          color: AppColors.normalCyanColor,
          onTap: () {
            Get.to(
              () => const SendFeedView(),
            );
          },
        ),
        screenHeight(45).ph,
        CustomSubTitleContainer(
          text: tr("key_about_us"),
          imageName: "ic_about_us",
          onTap: () {
            Get.to(() => const AboutUsView());
          },
        ),
      ],
    );
  }
}
