import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomToast {
  static showMessage(
      {required String message, MessageType? messageType = MessageType.INFO}) {
    String imageName = 'info';
    Color shadowColor = AppColors.mainBlueColor;
    switch (messageType) {
      case MessageType.REJECTED:
        imageName = 'rejected-01';
        shadowColor = AppColors.mainRedcolr;
        break;
      case MessageType.SUCCESS:
        imageName = 'approved1-01';
        shadowColor = AppColors.mainGreenColor;
        break;
      case MessageType.WARNING:
        imageName = 'warning';
        shadowColor = AppColors.mainOrangeColor;

        break;
      case MessageType.INFO:
        imageName = 'info';
        shadowColor = AppColors.mainbluecolor;
        break;
      default:
        null;
        break;
    }
    BotToast.showCustomText(
        duration: Duration(seconds: 3),
        toastBuilder: (value) {
          return Container(
            margin: EdgeInsets.all(screenWidth(10)),
            width: screenWidth(1.5),
            height: screenHieght(4),
            decoration: BoxDecoration(
                color: AppColors.mainWhiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: screenWidth(20),
                ),
                SvgPicture.asset(
                  'assets/images/$imageName.svg',
                  width: screenWidth(9),
                  height: screenWidth(9),
                ),
                SizedBox(
                  height: screenWidth(40),
                ),
                Text(message),
                SizedBox(
                  height: screenWidth(20),
                )
              ],
            ),
          );
        });
  }
}
