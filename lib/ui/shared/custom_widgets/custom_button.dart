import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    required this.onPressed,
    this.ImageName,
  });

  final String text;
  final String? ImageName;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) onPressed!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (ImageName != null) ...[
            SvgPicture.asset('images/$ImageName.svg'),
            // (screenWidth(2)).pw,
          ],
          SizedBox(
            width: (screenWidth(20)),
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        side: borderColor != null
            ? BorderSide(
                width: 1.0,
                color: borderColor!,
              )
            : null,
        backgroundColor: backgroundColor ?? AppColors.mainOrangeColor,
        shape: StadiumBorder(),
        fixedSize: Size(
          screenWidth(1.1),
          screenHieght(12),
          // size.height * 0.08,
        ),
      ),
    );
  }
}
