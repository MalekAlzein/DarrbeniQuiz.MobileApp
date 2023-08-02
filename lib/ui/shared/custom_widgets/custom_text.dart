import 'package:flutter/material.dart';
import '../colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.textColor,
    this.fontSize,
    this.bold = false,
    required this.text,
    required TextAlign textAlign,
  });
  final Color? textColor;
  final double? fontSize;
  final bool? bold;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize ?? 16,
          color: textColor ?? AppColors.mainback,
        ));
  }
}
// Big Text size fontSize: size.width * 0.1,
// Small text size fontSize: size.width * 0.04,