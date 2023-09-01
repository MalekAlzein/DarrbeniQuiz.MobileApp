import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/core/utils/string_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_radio.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_rich_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_tap_bar.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/register_view/register_controller.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: width * 0.05),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTapBar(
                      title: "إنشاء حساب",
                      imageName: "img_signup",
                      iconName: "ic_back",
                    ),
                    const CustomText(
                      textColor: AppColors.darkPurpleColor,
                      text: "اسم المستخدم",
                      textType: TextStyleType.SMALL,
                    ),
                    SizedBox(
                      height: screenWidth(100),
                    ),
                    CustomTextFormField(
                        fillColor: AppColors.lightCyanColorOpacity,
                        hintText: "اسم المستخدم",
                        validator: (value) {
                          if (value!.isEmpty) return 'الرجاء إدخال اسمك';

                          if (!StringUtil.isName(value)) {
                            return 'الرجاء التحقق من اسمك';
                          }
                          return null;
                        },
                        prefixIcon: 'ic_text_field_user',
                        controller: controller.userController),
                    SizedBox(
                      height: screenHeight(25),
                    ),
                    const CustomText(
                      textColor: AppColors.darkPurpleColor,
                      text: "رقم الموبايل",
                      textType: TextStyleType.SMALL,
                    ),
                    SizedBox(
                      height: screenWidth(100),
                    ),
                    CustomTextFormField(
                      fillColor: AppColors.lightCyanColorOpacity,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء إدخال رقم الموبايل';
                        }
                        if (!StringUtil.isMobile(value)) {
                          return 'الرجاء التحقق من الرقم';
                        }
                        return null;
                      },
                      prefixIcon: 'ic_text_field_phone',
                      controller: controller.phoneController,
                      hintText: 'رقم الموبايل',
                    ),
                    SizedBox(
                      height: screenHeight(25),
                    ),
                    const CustomText(
                      textColor: AppColors.darkPurpleColor,
                      text: "اختر الاختصاص",
                      textType: TextStyleType.SMALL,
                    ),
                    SizedBox(
                      height: screenHeight(28),
                    ),
                    Obx(() => controller.isloading.value
                        ? SpinKitWave(
                            color: AppColors.darkPurpleColor,
                            size: width * 0.09,
                          )
                        : Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              runSpacing: width * 0.01,
                              children: List.generate(
                                controller.specializationList.length,
                                (index) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomRadio(
                                        selected: controller.colegeId.value,
                                        onTaped: (value) {
                                          controller.colegeId.value = value!;
                                        },
                                        value: controller
                                            .specializationList[index][1],
                                      ),
                                      SizedBox(
                                        width: screenWidth(28),
                                      ),
                                      CustomText(
                                          textType: TextStyleType.SMALL,
                                          text: controller
                                              .specializationList[index][0]),
                                      SizedBox(
                                        width: screenWidth(28),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          )),
                    SizedBox(
                      height: screenHeight(28),
                    ),
                    CustomButton(
                      onPressed: () {
                        controller.register();
                      },
                      text: "إنشاء حساب",
                      textColor: AppColors.whiteColor,
                      buttonTypeEnum: ButtonTypeEnum.CUSTOM,
                      width: width,
                      height: screenHeight(13),
                    ),
                    SizedBox(
                      height: screenHeight(100),
                    ),
                    CustomRichText(
                        text1: 'لديك حساب؟',
                        text2: 'تسجيل الدخول',
                        ontap: () {
                          // Get.to(() => const LoginView());
                        }),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
