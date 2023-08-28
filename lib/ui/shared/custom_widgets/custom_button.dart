import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

enum ButtonTypeEnum {
  BIG,
  NORMAL,
  SMALL,
  CUSTOM,
}

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.buttonTypeEnum,
    this.text,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    required this.onPressed,
    this.imageName,
    this.width,
    this.height,
    this.imageColor,
    this.imageWidth,
    this.imageHeight,
    this.fontWeight,
    this.fontSize,
  });

  final ButtonTypeEnum buttonTypeEnum;
  final String? text;
  final String? imageName;
  final Color? imageColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Function? onPressed;
  final double? width;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final double? fontSize;
  final FontWeight? fontWeight;

  Map<String, dynamic> chooseButtonType() {
    switch (buttonTypeEnum) {
      case ButtonTypeEnum.NORMAL:
        return {
          "width": screenWidth(1.25),
          "height": screenHeight(13),
          "backgroundColor": AppColors.darkPurpleColor,
          "textColor": AppColors.whiteColor,
          "borderColor": borderColor,
          "fontSize": screenWidth(21),
          "fontWeight": FontWeight.bold,
        };

      case ButtonTypeEnum.SMALL:
        return {
          "width": screenWidth(3.6),
          "height": screenWidth(9),
          "backgroundColor": AppColors.darkPurpleColor,
          "textColor": AppColors.whiteColor,
          "borderColor": borderColor,
          "fontSize": screenWidth(21),
          "fontWeight": FontWeight.bold,
        };

      case ButtonTypeEnum.BIG:
        return {
          "width": screenWidth(1.25),
          "height": screenWidth(13),
          "backgroundColor": AppColors.darkPurpleColor,
          "textColor": AppColors.whiteColor,
          "borderColor": borderColor,
          "fontSize": screenWidth(21),
          "fontWeight": FontWeight.bold,
        };
      case ButtonTypeEnum.CUSTOM:
        return {
          "width": width,
          "height": height,
          "backgroundColor": backgroundColor,
          "textColor": textColor,
          "borderColor": borderColor,
          "fontSize": fontSize,
          "fontWeight": fontWeight,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? chooseButtonType()["width"] ?? screenWidth(1.1),
      height: height ?? chooseButtonType()["height"] ?? screenHeight(16),
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) onPressed!();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageName != null) ...[
              SvgPicture.asset(
                'assets/images/$imageName.svg',
                color: imageColor,
                width: imageWidth,
                height: imageHeight,
              ),
              (screenWidth(20)).pw,
            ],
            CustomText(
              textType: TextStyleType.BODY,
              text: text ?? "",
              textColor: textColor ?? chooseButtonType()["textColor"],
              //fontWeight: fontWeight ?? FontWeight.bold,
              fontSize:
                  fontSize ?? chooseButtonType()["fontSize"] ?? screenWidth(25),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          side:
              (borderColor != null || chooseButtonType()["borderColor"] != null)
                  ? BorderSide(
                      width: 1.0,
                      color: borderColor ?? chooseButtonType()["borderColor"],
                    )
                  : null,
          backgroundColor: backgroundColor ??
              chooseButtonType()["backgroundColor"] ??
              AppColors.darkPurpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          // fixedSize: Size(
          //   width ?? screenWidth(1.1),
          //   height ?? screenHeight(12),
          // ),
        ),
      ),
    );
  }
}
