import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class MainCategory extends StatelessWidget {
  const MainCategory(
      {super.key, required this.category, this.onClick = false, this.onTap});
  final String category;
  final bool onClick;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(30)),
      child: InkWell(
        onTap: () {
          if (onTap != null) onTap!();
        },
        child: Container(
            //width: screenWidth(3),
            height: screenWidth(8),
            // height: screenHeight(10),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: onClick
                  ? BorderDirectional(
                      bottom: BorderSide(
                        color: AppColors.darkGreyColor,
                      ),
                    )
                  : null,
            ),
            child: CustomText(
              textType: TextStyleType.SUBTITLE,
              text: category,
              textColor:
                  onClick ? AppColors.lightCyanColor : AppColors.darkGreyColor,
            )),
      ),
    );
  }
}
