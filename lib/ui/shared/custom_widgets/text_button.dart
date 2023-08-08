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
  });
  final String title;
  final double? textSize;
  final Color textColor;
  final Function onTap;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Text(
        title,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: textColor,
          fontSize: textSize ?? screenWidth(25),
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
