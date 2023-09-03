import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/question_view/question_view.dart';
import 'package:get/get.dart';

import '../../shared/custom_widgets/custom_app_bar.dart';
import '../../shared/utils.dart';
import '../register_view/register_controller.dart';
import 'course_details_controller.dart';

class BookCourseButtons extends StatefulWidget {
  const BookCourseButtons({
    super.key,
    required this.subjectID,
    required this.subject,
  });
  final String subjectID;

  final String subject;

  @override
  State<BookCourseButtons> createState() => _BookCourseButtonsState();
}

class _BookCourseButtonsState extends State<BookCourseButtons> {
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    CourseDetailsController courseDetailsController =
        Get.put(CourseDetailsController());

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenWidth(3)),
          child: Obx(() {
            print(courseDetailsController.questions);
            return CustomAppBar(
              firstText: ' registerController.specializationList[0]',
              secondText: widget.subject,
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
              text: 'دورات',
              backgroundColor: AppColors.normalCyanColor,
              onPressed: () {
                // homeViewControl ler.getLast5Exams(specialID: widget.specialID);
                // mainViewController.pageHeaderColor.value =
                //     AppColors.mainBlueColor;
                // context.push(SubjectTestView());
                // context.push(CoursesView(specialId: widget.specialID));
              },
              buttonTypeEnum: ButtonTypeEnum.CUSTOM,
            ),
            screenHeight(20).ph,
            CustomButton(
              text: 'أسئلة الكتاب',
              onPressed: () {
                courseDetailsController
                    .getSubjectBookQuestions(subjectID: widget.subjectID)
                    .then((value) => Get.to(QuestionView(
                          questions: courseDetailsController.questions,
                        )));
                // homeViewController.getSubjectBookQuestions(
                // subjectID: widget.subjectID);
                // context.push(SubjectTestView());

                // mainViewController.pageTitle.value += ' / أسئلة الكتاب';
              },
              buttonTypeEnum: ButtonTypeEnum.CUSTOM,
            ),
          ]),
        ));
  }
}
