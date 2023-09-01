import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_text.dart';

import '../colors.dart';
import '../utilis.dart';
class CustomRow extends StatelessWidget {
  const CustomRow({Key? key, required this.text,
    this.color=AppColors.darkGreyColor,
    this.svgname,
    this.onTap}
    ) : super(key: key);

  final String text;
  final Color? color;
  final String? svgname;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {onTap;},
      child: Row(
        children: [
          Container(
            color: color,
            height: screenHeight(15),
            width: screenWidth(90),
          ),
          SizedBox(width: screenWidth(35),),
          CustomText(textType: TextStyleType.BODY, text: text,textColor: color,),
          Spacer(),
          SvgPicture.asset(
            'images/$svgname.svg',
            color: color,
          )
        ],
      ),
    );
  }
}
