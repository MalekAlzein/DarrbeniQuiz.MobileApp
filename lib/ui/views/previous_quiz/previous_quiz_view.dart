import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class PreviousQuizView extends StatefulWidget {
  const PreviousQuizView({super.key});

  @override
  State<PreviousQuizView> createState() => _PreviousQuizViewState();
}

class _PreviousQuizViewState extends State<PreviousQuizView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomShapemakerWidget(
            backButton: false,
            imageName: "ic_back",
            firstText: tr("Key_previous_quiz"),
          ),
          ListView(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: screenWidth(25), vertical: screenWidth(20)),
            shrinkWrap: true,
            children: [
              CustomContainer(
                optionalImageName: 'ic_vector',
                text: '2023 دورة تشرين',
                textColor: AppColors.darkGreyColor,
                textType: TextStyleType.SMALL,
                imageName: 'ic_arrow',
              ),
              CustomContainer(
                optionalImageName: 'ic_vector',
                text: '2023 دورة تشرين',
                textColor: AppColors.darkGreyColor,
                textType: TextStyleType.SMALL,
                imageName: 'ic_arrow',
              ),
              CustomContainer(
                optionalImageName: 'ic_vector',
                text: '2023 دورة تشرين',
                textColor: AppColors.darkGreyColor,
                textType: TextStyleType.SMALL,
                imageName: 'ic_arrow',
              ),
              CustomContainer(
                optionalImageName: 'ic_vector',
                text: '2023 دورة تشرين',
                textColor: AppColors.darkGreyColor,
                textType: TextStyleType.SMALL,
                imageName: 'ic_arrow',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
