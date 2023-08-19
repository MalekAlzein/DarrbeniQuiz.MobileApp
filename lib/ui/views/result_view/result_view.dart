import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomShapemakerWidget(
            backButton: false,
            imageName: "ic_back",
            firstText: tr("Key_result"),
          ),
          CustomImages(
            imageName: 'Image',
            // imageColor: AppColors.darkPurpleColor,
            imageSize: screenWidth(5),
          ),
          CustomText(
            textAlign: TextAlign.center,
            textType: TextStyleType.SMALL,
            text: tr("Key_congratulations"),
            fontSize: screenWidth(20),
          ),
          CustomText(
            textAlign: TextAlign.start,
            textType: TextStyleType.SMALL,
            text: tr("Key_your_score"),
            fontSize: screenWidth(20),
          ),
          screenHeight(30).ph,
          Container(
            color: AppColors.darkGreyColor,
            width: screenWidth(1.8),
            height: screenHeight(300),
          ),
          screenHeight(30).ph,
          CustomText(
            textAlign: TextAlign.start,
            textType: TextStyleType.SMALL,
            text: tr("Key_numb_correct_questions"),
            fontSize: screenWidth(20),
          ),
          screenHeight(50).ph,
          CustomText(
            textAlign: TextAlign.start,
            textType: TextStyleType.SMALL,
            text: tr("Key_numb_wrong_questions"),
            fontSize: screenWidth(20),
          ),
          screenHeight(30).ph,
          CustomButton(
              buttonTypeEnum: ButtonTypeEnum.SMALL,
              text: tr("Key_Check_answers"),
              onPressed: () {})
        ],
      ),
    );
  }
}
