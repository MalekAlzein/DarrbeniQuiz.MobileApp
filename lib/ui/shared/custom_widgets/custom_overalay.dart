import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/app/app_config.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_rich_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/login_view/login_view.dart';
import 'package:flutter_templete/ui/views/register_view/register_view.dart';
import 'package:get/get.dart';

void showCustomAlertDialog({
  BuildContext? context,
  bool isNotReport = true,
  TextEditingController? report,
}) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: AppColors.darkPurpleColor, width: 2.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isNotReport) ...[
            SvgPicture.asset('assets/images/pop-up.svg'),
            (30).ph,
            const CustomText(
              text: 'يرجى الاشتراك لإتمام عملية التصفح',
              textType: TextStyleType.CUSTOM,
            ),
            (10).ph,
            CustomButton(
              text: 'تسجيل الدخول',
              textColor: AppColors.whiteColor,
              onPressed: () {
                Get.offAll(() => const LoginView());
              },
              buttonTypeEnum: ButtonTypeEnum.SMALL,
            ),
            (15).ph,
            CustomRichText(
              text1: 'ليس لديك حساب',
              text2: 'أنشأ حسابك الان',
              ontap: () {
                Get.offAll(() => const RegisterView());
              },
            ),
          ],
          if (!isNotReport) ...[
            CustomTextFormField(
              controller: report!,
              // mheight: width *0.5,
              hintText: 'ارسل شكوى/اقتراح',
              maxLines: 8, fillColor: AppConfig.mainColor,
            ),
            (10).ph,
            CustomButton(
              text: 'أرسل',
              textColor: AppColors.whiteColor,
              onPressed: () {
                Get.back();
              },
              buttonTypeEnum: ButtonTypeEnum.SMALL,
            ),
          ]
        ],
      ),
    ),
  );
}
