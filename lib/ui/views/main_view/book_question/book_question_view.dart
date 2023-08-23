import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_progress.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_question.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_small_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/book_question/questions_controller.dart';
import 'package:get/get.dart';

class BookQuestionView extends StatefulWidget {
  const BookQuestionView({super.key});

  @override
  State<BookQuestionView> createState() => _BookQuestionViewState();
}

class _BookQuestionViewState extends State<BookQuestionView> {
  QuestionsController controller = Get.put(QuestionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomShapemakerWidget(
            backButton: false,
            imageName: "ic_back",
            firstText: 'كلية الهندسة المعلوماتية',
            secondText: 'الشبكات',
            thirdText: 'أسئلة الكتاب',
            quizMode: true,
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: screenWidth(20),
            ),
            child: CustomText(textType: TextStyleType.SMALL, text: '100/25'),
          ),
          screenHeight(80).ph,
          CustomProgress(),
          screenHeight(80).ph,
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: screenWidth(20),
            ),
            child: CustomText(
              textAlign: TextAlign.start,
              textType: TextStyleType.SMALL,
              text: '25. الخدمة بأفضل جهد في بروتوكول الانترنت IPV4 تعني ان :',
            ),
          ),
          screenHeight(60).ph,
          SizedBox(
            height: screenHeight(2),
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
                  text: 'بروتوكول الأنترنت صالح لتطبيقات الوسائط المتعددة',
                  imageName: 'ic_answer_wrong',
                ),
                CustomQuestion(
                  textAlign: TextAlign.start,
                  textType: TextStyleType.SMALL,
                  text: 'بروتوكول الأنترنت صالح لتطبيقات الوسائط المتعددة',
                  imageName: 'ic_answer_wrong',
                ),
                CustomQuestion(
                  textAlign: TextAlign.start,
                  textType: TextStyleType.SMALL,
                  text: 'بروتوكول الأنترنت صالح لتطبيقات الوسائط المتعددة',
                  imageName: 'ic_answer_wrong',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: screenWidth(20),
            ),
            child: Row(
              children: [
                CustomSmallImage(
                  imageName: 'ic_answer_correct',
                  colorImage: AppColors.normalCyanColor,
                ),
                screenWidth(35).pw,
                CustomSmallImage(
                  imageName: 'ic_architecture',
                  colorImage: AppColors.darkGreyColor,
                ),
                screenWidth(35).pw,
                CustomSmallImage(imageName: 'ic_star_empty'),
              ],
            ),
          ),
          screenHeight(20).ph,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                    text: 'السابق',
                    buttonTypeEnum: ButtonTypeEnum.SMALL,
                    onPressed: () {}),
              ),
              Expanded(
                child: CustomButton(
                    text: 'التالي',
                    buttonTypeEnum: ButtonTypeEnum.SMALL,
                    onPressed: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
