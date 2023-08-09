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
  });
  final String title;
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
        style: TextStyle(
          decoration: textDecoration,
          color: textColor,
          fontSize: textSize ?? screenWidth(28),
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
