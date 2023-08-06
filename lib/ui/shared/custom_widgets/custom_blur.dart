import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:get/get.dart';

enum CustomBlurChildType {
  BOTTOMSHEET,
  DRAWER,
  DIALOUG,
}

class CustomBlurWidget extends StatelessWidget {
  const CustomBlurWidget({
    super.key,
    required this.child,
    required this.customBlurChildType,
  });
  
  final CustomBlurChildType customBlurChildType;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: Container(
              // width: screenWidthPercent(1),
              // height: screenHeightPercent(1),
              color: AppColors.mainWhiteColor.withOpacity(0.0),
            ),
          ),
        ),
        if (customBlurChildType == CustomBlurChildType.BOTTOMSHEET) ...[
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: child,
          )
        ],
        if (customBlurChildType == CustomBlurChildType.DRAWER) ...[
          PositionedDirectional(
            top: 0,
            bottom: 0,
            start: 0,
            child: child,
          ),
        ],
      ],
    );
  }
}
