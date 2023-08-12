import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

class CustomShapemakerWidget extends StatelessWidget {
  const CustomShapemakerWidget({
    super.key,
    this.backButton = true,
    this.quizMode = false,
    this.imageName,
    this.onTap,
    this.firstText,
    this.secondText,
    this.thirdText,
  });

  final bool backButton;
  final bool quizMode;
  final Function? onTap;
  final String? imageName;
  final String? firstText;
  final String? secondText;
  final String? thirdText;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: LandingClipper(),
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: screenWidth(20),
        ),
        width: screenWidth(1),
        height: screenHeight(4.5),
        decoration: BoxDecoration(
          color: AppColors.darkPurpleColor,
        ),
        child: firstText != null && secondText != null && thirdText != null
            ? ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  if (backButton) ...[
                    InkWell(
                      onTap: () {
                        if (quizMode) {
                          onTap!();
                          Get.back();
                        } else {
                          Get.back();
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/svgs/ic_back.svg',
                        width: screenWidth(14),
                        height: screenWidth(14),
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                  if (!backButton) ...[
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/svgs/$imageName.svg',
                        width: screenWidth(14),
                        height: screenWidth(14),
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                  if (firstText != null) ...[
                    screenWidth(35).pw,
                    Center(
                      child: CustomText(
                        textType: TextStyleType.SUBTITLE,
                        text: firstText!,
                        textColor: AppColors.whiteColor,
                      ),
                    ),
                  ],
                  if (secondText != null) ...[
                    Center(
                      child: CustomText(
                        textType: TextStyleType.SUBTITLE,
                        text: " / ${secondText!}",
                        textColor: AppColors.whiteColor,
                      ),
                    ),
                  ],
                  if (thirdText != null) ...[
                    Center(
                      child: CustomText(
                        textType: TextStyleType.SUBTITLE,
                        text: " / ${thirdText!}",
                        textColor: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ],
              )
            : Row(
                children: [
                  if (backButton) ...[
                    InkWell(
                      onTap: () {
                        if (quizMode) {
                          onTap!();
                          Get.back();
                        } else {
                          Get.back();
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/svgs/ic_back.svg',
                        width: screenWidth(14),
                        height: screenWidth(14),
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                  if (!backButton) ...[
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/svgs/$imageName.svg',
                        width: screenWidth(14),
                        height: screenWidth(14),
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                  if (firstText != null) ...[
                    screenWidth(35).pw,
                    CustomText(
                      textType: TextStyleType.SUBTITLE,
                      text: firstText!,
                      textColor: AppColors.whiteColor,
                    ),
                  ],
                  if (secondText != null) ...[
                    CustomText(
                      textType: TextStyleType.SUBTITLE,
                      text: " / ${secondText!}",
                      textColor: AppColors.whiteColor,
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}

class LandingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();

    path0.moveTo(0, 129.437);
    path0.cubicTo(40.9264, 89.4128, 132.639, 97.5311, 193.11, 102.884);
    path0.lineTo(193.112, 102.884);
    path0.cubicTo(194.891, 103.042, 196.643, 103.197, 198.366, 103.348);
    path0.cubicTo(214.838, 104.796, 230.495, 106.388, 245.321, 107.896);
    path0.cubicTo(316.899, 115.175, 369.087, 120.483, 400, 97.9876);
    path0.lineTo(400, 0);
    path0.lineTo(0, 0);
    path0.lineTo(0, 129.437);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
