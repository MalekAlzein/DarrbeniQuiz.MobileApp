// import 'package:flutter/material.dart';
// import 'package:flutter_templete/core/translation/app_translation.dart';
// import 'package:flutter_templete/core/utils/string_utils.dart';
// import 'package:flutter_templete/ui/shared/colors.dart';
// import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
// import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
// import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
// import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
// import 'package:flutter_templete/ui/shared/custom_widgets/text_button.dart';
// import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
// import 'package:flutter_templete/ui/shared/utils.dart';
// import 'package:flutter_templete/ui/views/edit_profile_view/edit_profile_controller.dart';
// import 'package:get/get.dart';

// class EditProfileView extends StatefulWidget {
//   const EditProfileView({
//     super.key,
//   });

//   @override
//   State<EditProfileView> createState() => _EditProfileViewState();
// }

// class _EditProfileViewState extends State<EditProfileView> {
//   EditProfileController controller = Get.put(EditProfileController());

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomShapemakerWidget(
//               backButton: false,
//               imageName: "ic_nav_bar_profile",
//               firstText: tr("Key_edit_profile"),
//             ),
//             ListView(
//               padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth(20), vertical: screenHeight(20)),
//               shrinkWrap: true,
//               children: [
//                 CustomText(
//                   textType: TextStyleType.BODY,
//                   text: 'اسم المستخدم',
//                   // controller.myProfileList[index].profile!.name ?? '',
//                   textColor: AppColors.darkPurpleColor,
//                   textAlign: TextAlign.start,
//                 ),
//                 screenHeight(30).ph,
//                 CustomTextFormField(
//                   hintText: '',
//                   // controller.myProfileList[index].profile!.name ?? '',
//                   hintTextSize: screenWidth(22),
//                   fillColor: AppColors.lightCyanColorOpacity,
//                   hintTextColor: AppColors.darkPurpleColorOpacity,
//                   prefixIcon: 'ic_text_field_user',
//                   suffixIcon: 'ic_edit',
//                   controller: controller.usernameController,
//                   validator: (value) {
//                     if (value!.isEmpty || StringUtil.isMobile(value)) {
//                       return 'please Enter your Name';
//                     }
//                     return null;
//                   },
//                 ),
//                 screenHeight(30).ph,
//                 CustomText(
//                   textType: TextStyleType.BODY,
//                   text: tr("Key_phone"),
//                   textColor: AppColors.darkPurpleColor,
//                   textAlign: TextAlign.start,
//                 ),
//                 screenHeight(30).ph,
//                 CustomTextFormField(
//                   hintText: '',
//                   // controller.myProfileList[index].profile!.phone ?? '',
//                   hintTextSize: screenWidth(22),
//                   fillColor: AppColors.lightCyanColorOpacity,
//                   hintTextColor: AppColors.darkPurpleColorOpacity,
//                   prefixIcon: 'ic_text_field_phone',
//                   suffixIcon: 'ic_edit',
//                   controller: controller.mobileController,
//                   validator: (value) {
//                     if (value!.isEmpty || StringUtil.isMobile(value)) {
//                       return 'please check your Password';
//                     }
//                     return null;
//                   },
//                 ),
//                 (screenWidth(7.5)).ph,
//                 CustomButton(
//                   buttonTypeEnum: ButtonTypeEnum.NORMAL,
//                   onPressed: () {
//                     Get.back();
//                   },
//                   backgroundColor: AppColors.darkPurpleColor,
//                   text: tr('Key_save_changes'),
//                 ),
//                 (screenWidth(30)).ph,
//                 Center(
//                   child: CustomTextButton(
//                     title: tr('Key_to_retreat'),
//                     onTap: () {},
//                     textColor: AppColors.darkGreyColor,
//                     textDecoration: TextDecoration.underline,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//?---
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/string_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/text_button.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/edit_profile_view/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({
    super.key,
  });

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomShapemakerWidget(
              backButton: false,
              imageName: "ic_nav_bar_profile",
              firstText: tr("Key_edit_profile"),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.myProfileList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        CustomText(
                          textType: TextStyleType.BODY,
                          text: controller.myProfileList[index].profile!.name ??
                              '',
                          textColor: AppColors.darkPurpleColor,
                          textAlign: TextAlign.start,
                        ),
                        screenHeight(30).ph,
                        CustomTextFormField(
                          hintText:
                              controller.myProfileList[index].profile!.name ??
                                  '',
                          hintTextSize: screenWidth(22),
                          fillColor: AppColors.lightCyanColorOpacity,
                          hintTextColor: AppColors.darkPurpleColorOpacity,
                          prefixIcon: 'ic_text_field_user',
                          suffixIcon: 'ic_edit',
                          controller: controller.usernameController,
                          validator: (value) {
                            if (value!.isEmpty || StringUtil.isMobile(value)) {
                              return 'please Enter your Name';
                            }
                            return null;
                          },
                        ),
                        screenHeight(30).ph,
                        CustomText(
                          textType: TextStyleType.BODY,
                          text: tr("Key_phone"),
                          textColor: AppColors.darkPurpleColor,
                          textAlign: TextAlign.start,
                        ),
                        screenHeight(30).ph,
                        CustomTextFormField(
                          hintText:
                              controller.myProfileList[index].profile!.phone ??
                                  '',
                          hintTextSize: screenWidth(22),
                          fillColor: AppColors.lightCyanColorOpacity,
                          hintTextColor: AppColors.darkPurpleColorOpacity,
                          prefixIcon: 'ic_text_field_phone',
                          suffixIcon: 'ic_edit',
                          controller: controller.mobileController,
                          validator: (value) {
                            if (value!.isEmpty || StringUtil.isMobile(value)) {
                              return 'please check your Password';
                            }
                            return null;
                          },
                        ),
                      ],
                    );
                  }),
            ),
            (screenWidth(7.5)).ph,
            CustomButton(
              buttonTypeEnum: ButtonTypeEnum.NORMAL,
              onPressed: () {
                Get.back();
              },
              backgroundColor: AppColors.darkPurpleColor,
              text: tr('Key_save_changes'),
            ),
            (screenWidth(30)).ph,
            Center(
              child: CustomTextButton(
                title: tr('Key_to_retreat'),
                onTap: () {},
                textColor: AppColors.darkGreyColor,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
