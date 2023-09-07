import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

import '../colors.dart';

class CustomChipContainer extends StatelessWidget {
  const CustomChipContainer({
    super.key,
    required this.text,
    this.borderColor,
    this.width,
    required this.onTap,
    this.backgroundColor,
  });
  final String text;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? width;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Chip(
        labelPadding: EdgeInsets.symmetric(
            horizontal: screenWidth(100), vertical: screenWidth(70)),
        backgroundColor: backgroundColor ?? AppColors.whiteColor,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth(100))),
        side: BorderSide(
          color: borderColor ?? AppColors.darkPurpleColor,
        ),
        label: CustomText(
          text: text,
          fontSize: screenWidth(27),
          textType: TextStyleType.CUSTOM,
        ),
      ),
    );
  }
}
