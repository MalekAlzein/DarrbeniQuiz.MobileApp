import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_question.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class AnswersView extends StatelessWidget {
  const AnswersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomShapemakerWidget(
            backButton: false,
            imageName: "ic_back",
            firstText: tr("Key_answers"),
          ),
          screenHeight(20).ph,
          Column(
            children: [
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
              screenHeight(25).ph,
              CustomButton(
                  buttonTypeEnum: ButtonTypeEnum.NORMAL,
                  text: tr("Key_Check_answers"),
                  onPressed: () {}),
              screenHeight(20).ph,
              Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: screenWidth(20),
                    ),
                    child: CustomText(
                      textAlign: TextAlign.start,
                      textType: TextStyleType.SMALL,
                      text:
                          '1. الخدمة بأفضل جهد في بروتوكول الانترنت IPV4 تعني ان :',
                    ),
                  ),
                ],
              ),
              screenHeight(60).ph,
              SizedBox(
                height: screenHeight(2.3),
                width: screenWidth(1),
                child: ListView(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: screenWidth(20),
                      vertical: screenWidth(20),
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      CustomQuestion(
                        textAlign: TextAlign.start,
                        textType: TextStyleType.SMALL,
                        text:
                            'بروتوكول الانترنت لا يقدم اليات تحكم بالتدفق او التحكم بالاأخطاء',
                        imageName: 'ic_answer_wrong',
                      ),
                      CustomQuestion(
                        textAlign: TextAlign.start,
                        textType: TextStyleType.SMALL,
                        text:
                            'بروتوكول الانترنت لا يقدم اليات تحكم بالتدفق او التحكم بالاأخطاء',
                        imageName: 'ic_answer_wrong',
                      ),
                      CustomQuestion(
                        textAlign: TextAlign.start,
                        textType: TextStyleType.SMALL,
                        text:
                            'بروتوكول الانترنت لا يقدم اليات تحكم بالتدفق او التحكم بالاأخطاء',
                        imageName: 'ic_answer_wrong',
                      ),
                      CustomQuestion(
                        textAlign: TextAlign.start,
                        textType: TextStyleType.SMALL,
                        text:
                            'بروتوكول الانترنت لا يقدم اليات تحكم بالتدفق او التحكم بالاأخطاء',
                        imageName: 'ic_answer_wrong',
                      ),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
