import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_grid_college.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_grid_view.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_main_category.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_slider.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_subtitle_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/home_view_category.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/loading_widget.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/book_question/book_question_view.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter_templete/ui/views/main_view/previous_quiz/previous_quiz_view.dart';
import 'package:flutter_templete/ui/views/subject_view/subject_controller.dart';
import 'package:get/get.dart';

class SubjectView extends StatefulWidget {
  const SubjectView({super.key, required this.specialization});
  final bool specialization;
  @override
  State<SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  HomeController homeController = Get.put(HomeController());
  SubjectController subjectController = Get.put(SubjectController());
  List<String> category = [
    'الكل',
    'الكليات الهندسية',
    'الكليات الطبية',
  ];
  int _selectedChoiceIndex = 0;
  List<String> _choices = ['Option 1', 'Option 2', 'Option 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomShapemakerWidget(specialization: widget.specialization),
          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: screenWidth(15),
                ),
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: tr("key_search"),
                      hintTextSize: screenWidth(30),
                      fillColor: AppColors.darkGreyColorTextField,
                      hintTextColor: AppColors.darkGreyColorOpacity,
                      prefixIcon: 'ic_search',
                      prefixIconColor: AppColors.darkGreyColorOpacity,
                    ),
                    screenHeight(40).ph,
                    Obx(
                      () {
                        print(subjectController.silderList);
                        return subjectController.silderList.isEmpty
                            ? LoadingWidget(
                                center: true,
                              )
                            : CustomSlider(
                                homeController: homeController,
                                silderList: homeController.silderList,
                              );
                      },
                    ),
                    CustomSubTitleContainer(
                      text: tr('key_category'),
                      color: AppColors.darkGreyColor,
                    ),
                    InkWell(
                      onTap: () {
                        showQuestionTypeBottomSheet();
                      },
                      child: ChipTheme(
                        data: ChipTheme.of(context).copyWith(
                          backgroundColor: AppColors
                              .whiteColor, // تعيين لون الخلفية العام للشرائح
                          labelStyle: TextStyle(
                              color: AppColors.darkPurpleColor,
                              fontSize: screenWidth(20)),
                          // تعيين نمط النص العام للشرائح
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              color:
                                  AppColors.darkPurpleColor, // تعيين لون الحدود
                              width: 1.5, // تعيين عرض الحدود
                            ), // تعيين شكل الحواف العام للشرائح
                          ),
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: screenWidth(60),
                          runSpacing: screenWidth(50),
                          children: <Widget>[
                            Chip(label: Text('المترجمات')),
                            Chip(label: Text('داتا بيز')),
                            Chip(label: Text('اوتومات')),
                            Chip(label: Text('الشبكات')),
                            Chip(label: Text(' الذكاء الاصطناعي')),
                            Chip(label: Text('قواعد البيانات')),
                            Chip(label: Text('هندسة برمجيات')),
                            Chip(label: Text('امن')),
                            Chip(label: Text('خوارزميات')),
                          ],
                        ),
                      ),
                    ),
                    screenHeight(30).ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                            backgroundColor: AppColors.lightCyanColor,
                            text: tr('Key_previous_quiz'),
                            buttonTypeEnum: ButtonTypeEnum.SMALL,
                            fontSize: screenWidth(30),
                            onPressed: () {
                              Get.to(() => const PreviousQuizView());
                            }),
                        CustomButton(
                            backgroundColor: AppColors.darkPurpleColor,
                            text: tr('Key_questions_bank'),
                            buttonTypeEnum: ButtonTypeEnum.SMALL,
                            fontSize: screenWidth(30),
                            onPressed: () {
                              Get.to(() => const BookQuestionView());
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
