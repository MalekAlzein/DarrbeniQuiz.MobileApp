import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/string_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/login_view/login_controller.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: controller.formKey,
      child: Padding(
        padding: EdgeInsetsDirectional.all(screenWidth(25)),
        child: SafeArea(
          child: ListView(children: [
            (screenWidth(10)).ph,
            Center(
              child: CustomText(
                  textType: TextStyleType.SUBTITLE,
                  textColor: AppColors.darkGreyColor,
                  text: "تسجيل الدخول"),
            ),
            (screenWidth(25)).ph,
            Center(child: SvgPicture.asset('assets/svgs/img_login.svg')),
            (screenWidth(25)).ph,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "اسم المستخدم",
                style: TextStyle(
                  height: 1.2,
                  decoration: TextDecoration.none,
                  color: AppColors.normalPurpleColor,
                  fontSize: screenWidth(15),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            (screenWidth(25)).ph,
            CustomTextFormField(
              hintText: "اسم المستخدم",
              fillColor: AppColors.lightCyanColorOpacity,
              prefixIcon: 'ic_text_field_user',
              controller: controller.userNameController,
              validator: (value) {
                if (value!.isEmpty || StringUtil.isName(value)) {
                  return 'please check your Name';
                }
                return null;
              },
            ),
            (screenWidth(25)).ph,
            Align(
              alignment: Alignment.centerRight,
              child: CustomText(
                textType: TextStyleType.SUBTITLE,
                text: "ادخل الرمز",
                textColor: AppColors.normalPurpleColor,
              ),
            ),
            (screenWidth(25)).ph,
            CustomTextFormField(
              hintText: "ادخل الرمز",
              fillColor: AppColors.lightCyanColorOpacity,
              prefixIcon: 'ic_text_field_code',
              controller: controller.codeController,
              validator: (value) {
                if (value!.isEmpty || StringUtil.isPassword(value)) {
                  return 'please check your Code';
                }
                return null;
              },
            ),
            (screenWidth(25)).ph,
            Obx(() {
              return controller.loader.value
                  ? SpinKitThreeBounce(
                      color: AppColors.darkPurpleColor,
                    )
                  : CustomButton(
                      buttonTypeEnum: ButtonTypeEnum.NORMAL,
                      onPressed: () {
                        controller.login();
                      },
                      backgroundColor: AppColors.darkPurpleColor,
                      text: "تسجيل دخول",
                    );
            }),
            (screenWidth(25)).ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: CustomText(
                    textType: TextStyleType.SMALL,
                    text: "ليس لديك حساب ؟",
                    textColor: AppColors.darkGreyColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Get.to(SignupView());
                  },
                  child: CustomText(
                    textType: TextStyleType.SMALL,
                    text: "أنشئ حسابك الان",
                    textColor: AppColors.darkPurpleColor,
                  ),
                ),
              ],
            ),
            (screenWidth(2.5)).ph,
            InkWell(
              onTap: () {
                Get.to(MainView());
              },
              child: Center(
                child: Text(
                  "المتابعة كزائر",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.darkGreyColor,
                    fontSize: screenWidth(28),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
