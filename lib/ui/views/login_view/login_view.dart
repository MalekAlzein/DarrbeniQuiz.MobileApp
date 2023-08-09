import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/text_button.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/login_view/login_controller.dart';
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
  late LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.all(screenWidth(25)),
          child: Column(
            children: [
              (screenWidth(10)).ph,
              CustomText(
                textType: TextStyleType.SUBTITLE,
                fontWeight: FontWeight.bold,
                textColor: AppColors.darkGreyColor,
                text: tr('key_login'),
              ),
              (screenWidth(25)).ph,
              SvgPicture.asset(
                'assets/svgs/img_login.svg',
                // width: double.infinity,

                // fit: BoxFit.fill,
              ),
              (screenWidth(25)).ph,
              Align(
                alignment: Alignment.centerRight,
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
                hintTextColor: AppColors.lightPurpleColorOpacity,
                prefixIcon: Icon(
                  Icons.person_outline,
                  size: screenWidth(13),
                ),
                prefixIconColor: AppColors.lightPurpleColorOpacity,
              ),
              (screenWidth(25)).ph,
              Align(
                alignment: Alignment.centerRight,
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
                hintTextColor: AppColors.lightPurpleColorOpacity,
                prefixIcon: Icon(
                  Icons.key_outlined,
                  size: screenWidth(13),
                ),
                prefixIconColor: AppColors.lightPurpleColorOpacity,
              ),
              (screenWidth(8)).ph,
              CustomButton(
                buttonTypeEnum: ButtonTypeEnum.NORMAL,
                onPressed: () {
                  Get.off(const SignupView());
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
                    onTap: () {},
                    textColor: AppColors.darkPurpleColor,
                  ),
                ],
              ),
              (screenWidth(2.5)).ph,
              CustomTextButton(
                title: tr('key_visitor'),
                onTap: () {},
                textColor: AppColors.darkGreyColor,
                textDecoration: TextDecoration.underline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
