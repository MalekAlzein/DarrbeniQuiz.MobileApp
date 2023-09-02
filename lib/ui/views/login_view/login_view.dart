import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/core/utils/string_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_rich_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_tap_bar.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/login_view/login_controller.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:flutter_templete/ui/views/register_view/register_view.dart';
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
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: controller.formKey1,
        child: Padding(
          padding: EdgeInsetsDirectional.all(screenWidth(25)),
          child: ListView(children: [
            // (screenWidth(10)).ph,
            CustomTapBar(title: "تسجيل الدخول", imageName: "img_login"),
            (screenWidth(25)).ph,
            Align(
              alignment: Alignment.centerRight,
              child: CustomText(
                textColor: AppColors.normalPurpleColor,
                text: "اسم المستخدم",
                textType: TextStyleType.SUBTITLE,
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
                if (value!.isEmpty) {
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
            CustomRichText(
              ontap: () {
                Get.to(() => RegisterView());
              },
              text1: "ليس لديك حساب ؟",
              text2: "أنشئ حسابك الان",
            ),
            (screenHeight(25)).ph,
            InkWell(
              onTap: () {
                Get.to(MainView());
              },
              child: Center(
                child: CustomText(
                  text: "المتابعة كزائر",
                  textColor: AppColors.darkGreyColor,
                  textDecoration: TextDecoration.underline,
                  textType: TextStyleType.SUBTITLE,
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
