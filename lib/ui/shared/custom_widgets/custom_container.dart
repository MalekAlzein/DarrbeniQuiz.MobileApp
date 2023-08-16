import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_small_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.imageName,
      this.imageSize,
      required this.text,
      required this.textColor,
      required this.textType,
      this.textAlign,
      this.fontSize,
      this.fontWeight,
      this.textDecoration});
  final String? imageName;
  final Color? textColor;
  final double? imageSize;
  final Color? imageColor = AppColors.darkGreyColor;
  final TextStyleType textType;
  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: screenHeight(11),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                screenWidth(80),
              ),
              color: AppColors.superLightBlueColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                textType: textType,
                text: text,
                textAlign: textAlign,
                fontWeight: fontWeight,
                fontSize: fontSize,
                textColor: textColor,
              ),
              CustomSmallImage(
                imageName: imageName ?? "",
                imageSize: screenHeight(70),
              ),
            ],
          ),
        ),
        screenHeight(50).ph,
      ],
    );
  }
}
