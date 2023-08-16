import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_popup_with_blur.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

void sendFeedBack({
  // required bool isLoading,
  // required Function? onTap,
  Widget? widget,
}) {
  // RxBool loading = isLoading.obs;
  Get.dialog(
    CustomPopupWithBlurWidget(
      customBlurChildType: CustomBlurChildType.DIALOUG,
      child: Container(
        width: screenWidth(1.2),
        height: screenHeight(2.5),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.darkPurpleColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkGreyColor,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(20), vertical: screenWidth(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(right: screenWidth(1.8)),
                child: CustomImages(
                  imageName: 'ic_close',
                  imageSize: screenHeight(40),
                ),
              ),
              CustomImages(
                imageName: 'img_feedback',
                imageSize: screenHeight(10),
              ),
              Material(
                child: CustomTextFormField(
                  maxWidth: screenWidth(1),
                  maxHeight: screenHeight(4),
                  hintText: tr('Key_send_feed'),
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.mainlightgrey,
                ),
              ),
              CustomButton(
                buttonTypeEnum: ButtonTypeEnum.SMALL,
                height: screenWidth(9),
                onPressed: () {},
                backgroundColor: AppColors.darkPurpleColor,
                text: tr('Key_send'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
