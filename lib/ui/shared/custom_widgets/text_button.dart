import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    super.key,
    required this.title,
    this.textSize,
    this.textColor = AppColors.darkPurpleColor,
    required this.onTap,
    this.fontWeight,
    this.textDecoration,
    this.textAlign,
  });
  final String title;
  final TextAlign? textAlign;
  final double? textSize;
  final Color textColor;
  final Function onTap;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Text(
        title,
        textAlign: textAlign,
        style: TextStyle(
          decoration: textDecoration,
          color: textColor,
          fontSize: textSize ?? screenWidth(30),
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
