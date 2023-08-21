import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

enum TextStyleType {
  TITLE, // 40px
  SUBTITLE, // 25px
  BODYBIG, // 22px
  BODY, // 20px
  SMALL, // 15px
  CUSTOM,
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.textType,
    required this.text,
    this.textColor = AppColors.darkGreyColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
  });

  final TextStyleType textType;
  final String text;
  final Color? textColor;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: 6,
      style: getTextStyle(),
    );
  }

  TextStyle getTextStyle() {
    switch (textType) {
      case TextStyleType.TITLE:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: textColor,
          fontSize: screenWidth(22),
          fontWeight: FontWeight.w900,
        );

      case TextStyleType.SUBTITLE:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: textColor,
          fontSize: screenWidth(24),
          fontWeight: fontWeight ?? FontWeight.w400,
        );

      case TextStyleType.BODYBIG:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: textColor,
          fontSize: screenWidth(25),
          fontWeight: fontWeight ?? FontWeight.w700,
        );

      case TextStyleType.BODY:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: textColor,
          fontSize: screenWidth(25),
          fontWeight: fontWeight ?? FontWeight.w400,
        );

      case TextStyleType.SMALL:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: textColor,
          fontSize: screenWidth(28),
          fontWeight: fontWeight ?? FontWeight.w400,
        );

      case TextStyleType.CUSTOM:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );
    }
  }
}
