import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/important_questions_view/important_questions_controller.dart';
import 'package:flutter_templete/ui/views/main_view/previous_quiz/previous_quiz_view.dart';
import 'package:get/get.dart';

class ImportantQuestionsView extends StatefulWidget {
  const ImportantQuestionsView({
    super.key,
  });

  @override
  State<ImportantQuestionsView> createState() => _ImportantQuestionsViewState();
}

class _ImportantQuestionsViewState extends State<ImportantQuestionsView> {
  ImportantQuestionsController controller =
      Get.put(ImportantQuestionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomShapemakerWidget(
          backButton: false,
          imageName: "ic_back",
          firstText: tr("Key_important_question"),
        ),
        ListView(
          shrinkWrap: true,
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: screenWidth(25),
            vertical: screenWidth(20),
          ),
          children: [
            CustomContainer(
              text: '1. الخدمة بأفضل جهد في بروتوكول الانترنت IPV4\nتعني ان :',
              textColor: AppColors.darkGreyColor,
              textType: TextStyleType.SMALL,
              imageName: 'ic_arrow',
            ),
            CustomContainer(
              text: '25. الخدمة بأفضل جهد في بروتوكول الانترنت IPV4\nتعني ان :',
              textColor: AppColors.darkGreyColor,
              textType: TextStyleType.SMALL,
              imageName: 'ic_arrow',
            ),
            screenHeight(10).ph,
            CustomButton(
                text: 'الدورات',
                buttonTypeEnum: ButtonTypeEnum.SMALL,
                onPressed: () {
                  Get.to(PreviousQuizView());
                }),
          ],
        ),
      ],
    ));
  }
}
