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
    this.specialization = false,
  });

  final bool backButton;
  final bool quizMode;
  final bool specialization;
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
        // width: screenWidth(1),
        height: screenHeight(6), //6
        decoration: BoxDecoration(
          color: specialization
              ? AppColors.lightCyanColor
              : AppColors.darkPurpleColor,
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
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.9956692);
    path_0.cubicTo(
        size.width * 0.1023160,
        size.height * 0.6877908,
        size.width * 0.3315976,
        size.height * 0.7502392,
        size.width * 0.4827741,
        size.height * 0.7914154);
    path_0.cubicTo(
        size.width * 0.4872235,
        size.height * 0.7926231,
        size.width * 0.4916071,
        size.height * 0.7938231,
        size.width * 0.4959153,
        size.height * 0.7949846);
    path_0.cubicTo(
        size.width * 0.5370965,
        size.height * 0.8061231,
        size.width * 0.5762376,
        size.height * 0.8183692,
        size.width * 0.6133012,
        size.height * 0.8299692);
    path_0.cubicTo(
        size.width * 0.7922471,
        size.height * 0.8859615,
        size.width * 0.9227176,
        size.height * 0.9267923,
        size.width,
        size.height * 0.7537508);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.9956692);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
