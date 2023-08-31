import 'package:flutter/material.dart';
import '../colors.dart';
import '../utils.dart';

class CustomRadio extends StatelessWidget {
  final int value;
  final Color? fillColor;
  final Function onTaped;
  final int selected;
  final double? width;
  final double? height;
  final double? scaleX;
  final double? scaleY;

  const CustomRadio({
    super.key,
    required this.value,
    this.fillColor,
    required this.onTaped,
    required this.selected,
    this.width,
    this.height,
    this.scaleX,
    this.scaleY,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scaleX: scaleX ?? screenWidth(320),
        scaleY: scaleY ?? screenWidth(320),
        //alignment: Alignment.centerLeft,
        child: Container(
          // color: AppColors.blackColor,
          width: width ?? screenWidth(40),
          height: height ?? screenWidth(20),
          child: Radio(
            value: value,
            groupValue: selected,
            onChanged: (int? value) {
              onTaped(value);
            },
            fillColor: MaterialStateColor.resolveWith(
                (states) => fillColor ?? AppColors.darkPurpleColor),
          ),
        ));
  }
}
