import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

enum CustomSmallButtonTypeEnum {
  SMALL, // EDIT
  NORMAL, // BACK
  BIG, // DELETE
}

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({
    super.key,
    required this.imageName,
    required this.onTap,
    required this.customSmallButtonTypeEnum,
    this.width,
    this.height,
  });

  final String imageName;
  final Function onTap;
  final CustomSmallButtonTypeEnum customSmallButtonTypeEnum;
  final double? width;
  final double? height;

  Map<String, dynamic> chooseButtonType() {
    switch (customSmallButtonTypeEnum) {
      case CustomSmallButtonTypeEnum.SMALL:
        return {
          "width": screenWidth(13),
          "height": screenWidth(13),
        };
      case CustomSmallButtonTypeEnum.NORMAL:
        return {
          "width": screenWidth(10),
          "height": screenWidth(10),
        };
      case CustomSmallButtonTypeEnum.BIG:
        return {
          "width": screenWidth(7),
          "height": screenWidth(7),
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: chooseButtonType()["width"] ?? width ?? screenWidth(10),
        height: chooseButtonType()["width"] ?? height ?? screenWidth(10),
        padding: EdgeInsetsDirectional.all(screenWidth(50)),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadiusDirectional.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.16),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: RotatedBox(
          quarterTurns:
              customSmallButtonTypeEnum == CustomSmallButtonTypeEnum.NORMAL &&
                      storage.getAppLanguage() == 'ar'
                  ? 2
                  : 0,
          child: SvgPicture.asset(
            'assets/svgs/$imageName.svg',
            color: AppColors.darkPurpleColor,
          ),
        ),
      ),
    );
  }
}
