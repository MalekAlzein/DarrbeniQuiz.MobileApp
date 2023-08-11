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
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            color: AppColors.whiteColor.withOpacity(0.0),
          ),
        ),
      ),
    );
  }
}
