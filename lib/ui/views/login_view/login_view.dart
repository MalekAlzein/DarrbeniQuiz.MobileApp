import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/string_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/text_button.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/login_view/login_controller.dart';
import 'package:flutter_templete/ui/views/login_view/login_view_widgets/login_top_section.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_view.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: screenWidth(25),
              vertical: screenWidth(10),
            ),
            children: [
              // (screenWidth(10)).ph,
              LoginTopSectionWidget(),
              (screenHeight(40)).ph,
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: CustomText(
                  textType: TextStyleType.SUBTITLE,
                  text: tr('key_user_name'),
                  textColor: AppColors.normalPurpleColor,
                ),
              ),
              CustomTextFormField(
                hintText: tr('key_user_name'),
                hintTextSize: screenWidth(22),
                fillColor: AppColors.lightCyanColorOpacity,
                hintTextColor: AppColors.darkPurpleColorOpacity,
                prefixIcon: 'ic_text_field_user',
                controller: controller.usernameController,
              ),
              (screenHeight(40)).ph,
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: CustomText(
                  textType: TextStyleType.SUBTITLE,
                  text: tr('key_inter_code'),
                  textColor: AppColors.normalPurpleColor,
                ),
              ),
              CustomTextFormField(
                hintText: tr('key_inter_code'),
                hintTextSize: screenWidth(22),
                fillColor: AppColors.lightCyanColorOpacity,
                hintTextColor: AppColors.darkPurpleColorOpacity,
                prefixIcon: 'ic_text_field_code',
                controller: controller.enterCodeController,
                validator: (value) {
                  if (value!.isEmpty || StringUtil.isPassword(value)) {
                    return 'please check your Password';
                  }
                },
              ),
              (screenWidth(8)).ph,
              CustomButton(
                buttonTypeEnum: ButtonTypeEnum.NORMAL,
                onPressed: () {
                  Get.to(() => const MainView());
                },
                backgroundColor: AppColors.darkPurpleColor,
                text: tr('key_login'),
              ),
              (screenWidth(40)).ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    textType: TextStyleType.SMALL,
                    text: tr('key_donot_have_account'),
                    textColor: AppColors.darkGreyColor,
                  ),
                  CustomTextButton(
                    title: tr('key_create_account_now'),
                    onTap: () {
                      Get.to(() => const SignupView());
                    },
                    textColor: AppColors.darkPurpleColor,
                  ),
                ],
              ),
              (screenWidth(2.5)).ph,
              Center(
                child: CustomTextButton(
                  title: tr('key_visitor'),
                  onTap: () {},
                  textColor: AppColors.darkGreyColor,
                  textDecoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
