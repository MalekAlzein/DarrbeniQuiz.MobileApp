import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../colors.dart';
import '../utils.dart';
import 'custom_text.dart';

class CustomRow extends StatelessWidget {
  const CustomRow(
      {Key? key,
      required this.text,
      this.color = AppColors.darkGreyColor,
      this.svgname,
      this.onTap,
      this.height = 17,
      this.width = 200,
      this.type = TextStyleType.SMALL})
      : super(key: key);

  final String text;
  final Color? color;
  final String? svgname;
  final Function? onTap;
  final double? height;
  final double? width;
  final TextStyleType? type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Row(
        children: [
          Container(
            color: color,
            height: screenHeight(height!),
            width: screenWidth(width!),
          ),
          SizedBox(
            width: screenWidth(35),
          ),
          CustomText(
            textType: type!,
            text: text,
            textColor: color,
          ),
          Spacer(),
          SvgPicture.asset(
            'assets/svgs/$svgname.svg',
            color: color,
          )
        ],
      ),
    );
  }
}
