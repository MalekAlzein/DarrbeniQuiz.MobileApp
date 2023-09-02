import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

//! -- This Custom File can use in Login & Register views
class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.ontap});
  final String text1, text2;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: text1,
          textType: TextStyleType.SMALL,
          textColor: AppColors.darkGreyColor,
        ),
        InkWell(
          highlightColor: Colors.transparent,
          onTap: ontap,
          child: SizedBox(
            width: screenWidth(4),
            height: screenHeight(20),
            child: Center(
              child: CustomText(
                textType: TextStyleType.SMALL,
                text: text2,
                textColor: AppColors.darkPurpleColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
