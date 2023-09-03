import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomSubTitleContainer extends StatelessWidget {
  const CustomSubTitleContainer({
    super.key,
    required this.text,
    this.imageName,
    this.color,
    this.onTap,
  });

  final String text;
  final String? imageName;
  final Color? color;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        height: screenHeight(15),
        alignment: AlignmentDirectional.center,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: screenWidth(30),
        ),
        decoration: BoxDecoration(
          border: BorderDirectional(
            start: BorderSide(
              width: 2,
              color: color ?? AppColors.darkPurpleColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              textType: TextStyleType.SUBTITLE,
              text: text,
              textColor: color ?? AppColors.darkPurpleColor,
            ),
            if (imageName != null) ...[
              SvgPicture.asset(
                'assets/svgs/$imageName.svg',
                width: screenWidth(14),
                height: screenWidth(14),
                color: color ?? AppColors.darkPurpleColor,
              )
            ]
          ],
        ),
      ),
    );
  }
}
