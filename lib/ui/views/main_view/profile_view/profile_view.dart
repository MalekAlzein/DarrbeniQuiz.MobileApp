import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_controller.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_view_widgets/avatar.dart';
import 'package:flutter_templete/ui/views/splash_screen/spalsh_screen_view.dart';
import 'package:flutter_templete/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

import 'profile_view_widgets/profile_middle_section.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomShapemakerWidget(
          backButton: false,
          imageName: "ic_nav_bar_profile",
          firstText: tr("key_profile"),
        ),
        ListView(
          shrinkWrap: true,
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: screenWidth(25),
            // vertical: screenWidth(10),
          ),
          children: [
            Center(
              child: AvatarWidget(
                controller: controller,
              ),
            ),
            screenHeight(50).ph,
            CustomText(
              textType: TextStyleType.TITLE,
              text: tr("key_user_name"),
            ),
            screenHeight(30).ph,
            ProfileMiddleSectionWidget(),
            screenHeight(45).ph,
            CustomButton(
              buttonTypeEnum: ButtonTypeEnum.NORMAL,
              text: tr('key_logout'),
              backgroundColor: AppColors.darkPurpleColor,
              onPressed: () {
                storage.clearTokenInfo();
                Get.delete<SplashScreenController>();
                Get.off(() => SplashScreenView());
              },
            ),
          ],
        ),
      ],
    );
  }
}
