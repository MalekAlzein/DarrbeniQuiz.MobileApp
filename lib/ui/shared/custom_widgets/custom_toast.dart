import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/enums/message_type.dart';
import '../colors.dart';
import '../utils.dart';
import 'custom_text.dart';

class CustomToast {
  static showMessage(
      {required String message, MessageType? messageType = MessageType.INFO}) {
    BotToast.showCustomText(
      duration: Duration(seconds: 6),
      toastBuilder: (cancelFunc) {
        String imageName;
        Color shadowColor;

        switch (messageType!) {
          case MessageType.INFO:
            imageName = 'INFO';
            shadowColor = AppColors.maingrey;
            break;

          case MessageType.WARNING:
            imageName = 'WARNING';
            shadowColor = AppColors.maingrey;
            break;

          case MessageType.REJECTED:
            imageName = 'REJECTED';
            shadowColor = AppColors.maingrey;
            break;

          case MessageType.SUCCESS:
            imageName = 'SUCCESS';
            shadowColor = AppColors.maingrey;
            break;
        }

        return GestureDetector(
          onTap: cancelFunc, // Dismiss the toast when tapped
          child: Container(
            width: screenWidth(1.5),
            height: screenWidth(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenWidth(10)),
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  spreadRadius: 0.5,
                  blurRadius: 3,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.asset(
                  'assets/lottie/$imageName.json',
                  width: screenWidth(6),
                ),
                SizedBox(
                  height: screenWidth(15),
                ),
                CustomText(
                  text: message,
                  textColor: AppColors.blackColor,
                  textType: TextStyleType.BODY,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
