import 'package:flutter/material.dart';
import 'package:flutter_templete/core/utils/string_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_radio.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_rich_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shimmer.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_tap_bar.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
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
                    (screenHeight(100)).ph,
                    CustomTextFormField(
                        fillColor: AppColors.lightCyanColorOpacity,
                        hintText: "اسم المستخدم",
                        validator: (value) {
                          if (value!.isEmpty) return 'الرجاء إدخال اسمك';

                          if (!StringUtil.isLastName(value)) {
                            return 'الرجاء التحقق من اسمك';
                          }
                          return null;
                        },
                        prefixIcon: 'ic_text_field_user',
                        controller: controller.userController),
                    (screenHeight(25)).ph,
                    const CustomText(
                      textColor: AppColors.darkPurpleColor,
                      text: "رقم الموبايل",
                      textType: TextStyleType.SMALL,
                    ),
                    (screenWidth(100)).ph,
                    CustomTextFormField(
                      fillColor: AppColors.lightCyanColorOpacity,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء إدخال رقم الموبايل';
                        }
                        if (!StringUtil.isValidSyriaMobileNumber(value)) {
                          return 'الرجاء التحقق من الرقم';
                        }
                        return null;
                      },
                      prefixIcon: 'ic_text_field_phone',
                      controller: controller.phoneController,
                      hintText: 'رقم الموبايل',
                    ),
                    (screenHeight(25)).ph,
                    const CustomText(
                      textColor: AppColors.darkPurpleColor,
                      text: "اختر الاختصاص",
                      textType: TextStyleType.SMALL,
                    ),
                    (screenHeight(28)).ph,
                    Obx(() => CustomShimmer(
                        child: Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: width * 0.04,
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
                                    (screenWidth(28)).pw,
                                    CustomText(
                                        textType: TextStyleType.SMALL,
                                        text: controller
                                            .specializationList[index][0]),
                                    (screenWidth(28)).pw,
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        isLoading: controller.isloading.value)),
                    (screenHeight(28)).ph,
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
                    (screenHeight(100)).ph,
                    CustomRichText(
                        text1: 'لديك حساب؟',
                        text2: 'تسجيل الدخول',
                        ontap: () {
                          //!  if Check this code you need to uncomment the line below --**--
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
