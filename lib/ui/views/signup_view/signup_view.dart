import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/text_button.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_controller.dart';
import 'package:get/get.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late int selectedValue = 1;
  SignupController controller = Get.put(SignupController());

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
                text: tr('key_create_account'),
              ),
              (screenWidth(25)).ph,
              SvgPicture.asset(
                'assets/svgs/img_signup.svg',
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
                  text: tr('key_mobile_number'),
                  textColor: AppColors.normalPurpleColor,
                ),
              ),
              CustomTextFormField(
                hintText: tr('key_mobile_number'),
                hintTextSize: screenWidth(22),
                fillColor: AppColors.lightCyanColorOpacity,
                hintTextColor: AppColors.lightPurpleColorOpacity,
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  size: screenWidth(13),
                ),
                prefixIconColor: AppColors.lightPurpleColorOpacity,
              ),
              (screenWidth(25)).ph,
              Align(
                alignment: Alignment.centerRight,
                child: CustomText(
                  textType: TextStyleType.SUBTITLE,
                  text: tr('key_select_specialty'),
                  textColor: AppColors.normalPurpleColor,
                ),
              ),
              (screenWidth(50)).ph,
              Row(
                children: <Widget>[
                  buildRadioButton(1, 'key_medicine'),
                  buildRadioButton(2, 'key_dentistry'),
                  buildRadioButton(3, 'key_faculty_of_pharmacy'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildRadioButton(4, 'key_it'),
                  buildRadioButton(5, 'key_architecture'),
                  buildRadioButton(6, 'key_nursing'),
                ],
              ),
              (screenWidth(10)).ph,
              CustomButton(
                buttonTypeEnum: ButtonTypeEnum.NORMAL,
                onPressed: () {
                  Get.off(const SignupView());
                },
                backgroundColor: AppColors.darkPurpleColor,
                text: tr('key_create_account'),
              ),
              (screenWidth(40)).ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    textType: TextStyleType.SMALL,
                    text: tr('key_have_account'),
                    textColor: AppColors.darkGreyColor,
                  ),
                  CustomTextButton(
                    title: tr('key_login'),
                    onTap: () {},
                    textColor: AppColors.darkPurpleColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadioButton(int value, String key) {
    return Expanded(
      child: Row(children: [
        Radio(
          value: value,
          groupValue: selectedValue,
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          activeColor: AppColors.darkPurpleColor,
        ),
        CustomText(
          textType: TextStyleType.CUSTOM,
          text: tr(key),
          fontSize: screenWidth(42),
          textColor: AppColors.darkGreyColor,
          fontWeight: FontWeight.bold,
        )
      ]),
    );
  }
}
