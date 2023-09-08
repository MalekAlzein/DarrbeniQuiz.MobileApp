import 'package:flutter/material.dart';
import 'package:flutter_templete/app/app_config.dart';
import 'package:flutter_templete/core/data/models/apis/subject_model.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/question_view/question_view.dart';
import 'package:get/get.dart';

import '../../../core/enums/terms_type.dart';
import '../../shared/custom_widgets/custom_app_bar.dart';
import '../../shared/utils.dart';
import '../register_view/register_controller.dart';
import '../years_questions_view/years_questions_view.dart';
import 'subject_view_controller.dart';

class BookCourseButtons extends StatefulWidget {
  const BookCourseButtons({
    super.key,
    required this.subject,
  });

  final SubjectModel subject;

  @override
  State<BookCourseButtons> createState() => _BookCourseButtonsState();
}

class _BookCourseButtonsState extends State<BookCourseButtons> {
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    SubjectViewController subjectViewController =
        Get.put(SubjectViewController());

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenWidth(3)),
          child: Obx(() {
            print(subjectViewController.questions);
            return CustomAppBar(
              activeColor: AppConfig.mainColor,
              firstText: getUserSelectedCollege,
              secondText: widget.subject.name,
              onTap: () => Get.back(),
            );
          }),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 60,
          ),
          child: Column(children: [
            CustomButton(
              text: tr("Key_terms"),
              backgroundColor: AppColors.normalCyanColor,
              onPressed: () {
                Get.to(() => YearsQuestionsView(
                      subjectId: widget.subject.id!,
                      termsType: TermsType.SINGLE_SUBJECT,
                    ));
              },
              buttonTypeEnum: ButtonTypeEnum.CUSTOM,
            ),
            screenHeight(20).ph,
            CustomButton(
              text: tr("Key_book_questions"),
              onPressed: () {
                subjectViewController
                    .getSubjectBookQuestions(
                        subjectID: widget.subject.id.toString())
                    .then((value) => Get.to(QuestionView(
                          questions: subjectViewController.questions,
                        )));
              },
              buttonTypeEnum: ButtonTypeEnum.CUSTOM,
            ),
          ]),
        ));
  }
}
