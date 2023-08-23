import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: screenWidth(20),
      ),
      child: Container(
        width: screenWidth(1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            minHeight: 7,
            value: 0.3,
            // value: controller.progress.value,
            backgroundColor: AppColors.darkPurpleColor,
            color: AppColors.normalCyanColor,
          ),
        ),
      ),
    );
  }
}
