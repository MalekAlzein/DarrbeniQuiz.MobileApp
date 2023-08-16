import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_small_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.imageName,
      this.imageSize,
      this.imageColor,
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
  final Color? imageColor;
  final TextStyleType textType;
  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            screenWidth(80),
          ),
          color: AppColors.normalCyanColorOpacity),
      child: Row(
        children: [
          CustomText(
            textType: textType,
            text: text,
            textAlign: textAlign,
            fontWeight: fontWeight,
            fontSize: fontSize,
            textColor: textColor,
          ),
          CustomImage(
            imageName: 'assets/svgs/$imageName.svg',
            imageSize: imageSize,
            colorImage: imageColor,
          ),
        ],
      ),
    );
  }
}
