import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

class CustomRadio extends StatelessWidget {
  CustomRadio({
    super.key,
    required this.text,
    required this.value,
    required this.selectedValue,
  });

  final String text;
  final int value;
  RxInt selectedValue = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: value,
          groupValue: selectedValue.value,
          onChanged: (newValue) {
            selectedValue.value = newValue!;
          },
          activeColor: AppColors.darkPurpleColor,
        ),
        CustomText(
          textType: TextStyleType.CUSTOM,
          text: tr(text),
          fontSize: screenWidth(34),
          textColor: AppColors.darkGreyColor,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
