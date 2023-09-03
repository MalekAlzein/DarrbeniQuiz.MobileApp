import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_chip_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_chip_list.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/course_details_view/book_terms_buttons_view.dart';
import 'package:flutter_templete/ui/views/course_details_view/course_details_controller.dart';
import 'package:flutter_templete/ui/views/register_view/register_controller.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_app_bar.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/utils.dart';
import '../question_view/question_view.dart';

class CourseDetailsView extends StatefulWidget {
  const CourseDetailsView({super.key});

  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView> {
  CourseDetailsController courseDetailsController =
      Get.put(CourseDetailsController());
  RegisterController registerController = Get.put(RegisterController());
  List<String> list = [
    'مترجمات',
    'داتابيز',
    'اوتومات',
    'الشبكات',
    'الذكاء الاصطناعي',
    'قواعد المعطيات',
    'هندسة برمجيات',
    'امن',
    'خوارزميات',
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          {}
          return Future(() {}
              // =>
              //     AppConfig.currentEducation == EducationType.MASTER
              //         ? courseDetailsController.showMasterSpecializations(
              //             specialid: storage.getUserInfo()!.collageUuid!)
              //         : courseDetailsController.showGraduationItem(
              //             specialid: widget.specialId)
              );
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenWidth(3)),
            child: Obx(() {
              print(courseDetailsController.questions);
              return CustomAppBar(
                firstText: registerController.specializationList[0],
              );
            }),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(30),
            ),
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                // HomeTopSection(),
                ListView(
                  children: [
                    screenHeight(30).ph,
                    Center(
                      child: CustomChipList(
                        direction: Axis.horizontal,
                        children: List.generate(
                          9,
                          // courseDetailsController.collegeSubjects.length,
                          (index) => CustomChipContainer(
                            text: list[index],

                            //  courseDetailsController.collegeSubjects[index],,
                            onTap: () {
                              Get.to(BookCourseButtons(
                                subjectID: '1',
                                subject: list[index],
                              ));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenWidth(7), horizontal: screenWidth(7)),
                    child: Flexible(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: "الدورات",
                              backgroundColor: AppColors.normalCyanColor,
                              onPressed: () {
                                // courseDetailsController.getLast5Exams(
                                //     specialID: widget.specialId);
                                // mainViewController.pageTitle.value =
                                //     ' الدورات';
                                // context.push(CoursesView(
                                //     specialId: widget.specialId));
                              },
                              fontSize: screenWidth(27),
                              buttonTypeEnum: ButtonTypeEnum.SMALL,
                            ),
                          ),
                          30.pw,
                          Expanded(
                            child: CustomButton(
                              text: "بنك الأسئلة",
                              onPressed: () {
                                // mainViewController.pageTitle.value =
                                //     ' الأسئلة';
                                courseDetailsController.getBankQuestions(
                                    specialid: 1);
                                Get.to(QuestionView(
                                  questions: courseDetailsController.questions,
                                ));
                              },
                              fontSize: screenWidth(27),
                              buttonTypeEnum: ButtonTypeEnum.SMALL,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
