import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:get/get.dart';

double screenWidth(double percent) {
  return Get.width / percent;
}

double screenHieght(double percent) {
  return Get.height / percent;
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
          decoration: BoxDecoration(
              color: AppColors.mainback.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          width: screenWidth(4),
          height: screenHieght(4),
          child: SpinKitCircle());
    });
