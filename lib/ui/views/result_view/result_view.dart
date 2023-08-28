import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/answers_view/answers_view.dart';
import 'package:get/get.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomShapemakerWidget(
            backButton: false,
            imageName: "ic_back",
            firstText: tr("Key_result"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImages(
                  imageName: '',
                  // imageColor: AppColors.darkPurpleColor,
                  imageSize: screenWidth(5),
                ),
                CustomText(
                  textAlign: TextAlign.center,
                  textType: TextStyleType.SMALL,
                  text: tr("Key_congratulations"),
                  fontSize: screenWidth(15),
                  fontWeight: FontWeight.bold,
                ),
                screenHeight(80).ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      // textAlign: TextAlign.center,
                      textType: TextStyleType.SMALL,
                      text: tr("Key_your_score"),
                      fontSize: screenWidth(25),
                      fontWeight: FontWeight.bold,
                    ),
                    screenWidth(80).pw,
                    CustomText(
                      textType: TextStyleType.SMALL,
                      text: '80/100',
                      fontSize: screenWidth(20),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                screenHeight(50).ph,
                Container(
                  color: AppColors.darkGreyColor,
                  width: screenWidth(1.8),
                  height: screenHeight(300),
                ),
                screenHeight(50).ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      textAlign: TextAlign.start,
                      textType: TextStyleType.SMALL,
                      text: tr("Key_numb_correct_questions"),
                      fontSize: screenWidth(20),
                    ),
                    screenWidth(80).pw,
                    CustomText(
                      textType: TextStyleType.SMALL,
                      text: '40',
                      fontSize: screenWidth(20),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                screenHeight(50).ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      textAlign: TextAlign.start,
                      textType: TextStyleType.SMALL,
                      text: tr("Key_numb_wrong_questions"),
                      fontSize: screenWidth(20),
                    ),
                    screenWidth(80).pw,
                    CustomText(
                      textType: TextStyleType.SMALL,
                      text: '60',
                      fontSize: screenWidth(20),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                screenHeight(25).ph,
                CustomButton(
                    buttonTypeEnum: ButtonTypeEnum.NORMAL,
                    text: tr("Key_Check_answers"),
                    onPressed: () {
                      Get.to(
                        () => AnswersView(),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
