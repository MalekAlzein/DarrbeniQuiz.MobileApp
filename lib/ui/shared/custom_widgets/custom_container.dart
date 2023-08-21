import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_small_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    this.imageName,
    this.imageSize,
    required this.text,
    required this.textColor,
    required this.textType,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.textDecoration,
    this.optionalImageName,
    this.spaceBetweenWidgets,
  });
  final String? imageName;
  final String? optionalImageName;
  final Color? textColor;
  final double? imageSize;
  final TextStyleType textType;
  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final double? spaceBetweenWidgets;
  final Color? imageColor = AppColors.darkGreyColor;
  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  static int counter = 1;
  @override
  Widget build(BuildContext context) {
    Color? containerColor;

    if (widget.optionalImageName != null || counter.isOdd) {
      containerColor = counter.isOdd
          ? AppColors.normalCyanColor
          : AppColors.darkPurpleColorOpacity;
    }
    counter++;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
          height: screenHeight(11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              screenWidth(80),
            ),
            color: widget.optionalImageName != null
                ? containerColor
                : AppColors.superLightBlueColor,
          ),
          child: Row(
            mainAxisAlignment: widget.optionalImageName != null
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              if (widget.optionalImageName != null) ...[
                CustomSmallImage(
                  imageName: widget.optionalImageName!,
                  imageSize: screenHeight(40),
                ),
                screenWidth(widget.spaceBetweenWidgets ?? 40).pw,
              ],
              CustomText(
                textType: widget.textType,
                text: widget.text,
                textAlign: widget.textAlign,
                fontWeight: widget.fontWeight,
                fontSize: widget.fontSize,
                textColor: widget.textColor,
              ),
              if (widget.optionalImageName != null) ...[
                screenWidth(widget.spaceBetweenWidgets ?? 2.1).pw,
              ],
              CustomSmallImage(
                imageName: widget.imageName ?? "",
                imageSize: screenHeight(70),
              ),
            ],
          ),
        ),
        screenHeight(50).ph,
      ],
    );
  }
}
