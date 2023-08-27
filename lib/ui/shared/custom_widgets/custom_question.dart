import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_small_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/book_question/book_questions_controller.dart';
import 'package:get/get.dart';

class CustomQuestion extends StatelessWidget {
  const CustomQuestion({
    super.key,
    this.imageName,
    this.textColor,
    this.imageSize,
    required this.textType,
    required this.text,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.textDecoration,
    this.imageColor,
    this.isSelectedColor,
  });
  final String? imageName;
  final Color? textColor;
  final double? imageSize;
  final TextStyleType textType;
  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;

  final int selectedValue = 1;
  final Color? imageColor;
  final bool? isSelectedColor;
  @override
  Widget build(BuildContext context) {
    QuestionsController controller = Get.put(QuestionsController());
    return Column(
      children: [
        Container(
          // padding: EdgeInsets.symmetric(horizontal: screenWidth(50)),
          height: screenHeight(10),
          decoration: BoxDecoration(
              border: Border.all(width: 1.1, color: AppColors.darkGreyColor),
              borderRadius: BorderRadius.circular(
                screenWidth(80),
              ),
              color: AppColors.whiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Radio(
                value: 0,
                groupValue: selectedValue,
                onChanged: (value) {
                  controller.setAnswer(value!);
                },
                activeColor: AppColors.mainRedColor,
              ),
              Flexible(
                child: CustomText(
                  textType: textType,
                  text: text,
                  textAlign: textAlign,
                  textColor: textColor,
                ),
              ),
              // screenWidth(2.7).pw,
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: screenWidth(50),
                ),
                child: CustomSmallImage(
                  imageName: imageName ?? "",
                  imageSize: screenHeight(35),
                ),
              ),
            ],
          ),
        ),
        screenHeight(60).ph,
      ],
    );
  }
}
