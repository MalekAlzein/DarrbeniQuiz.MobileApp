import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_chip_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_chip_list.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_page_controller.dart';
import 'package:get/get.dart';

import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/utils.dart';
import 'home_top_section.dart';

class CourseDetailsView extends StatefulWidget {
  const CourseDetailsView({super.key});

  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView> {
  HomePageController homeViewController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: () {
          {}
          return Future(() {}
              // =>
              //     AppConfig.currentEducation == EducationType.MASTER
              //         ? homeViewController.showMasterSpecializations(
              //             specialid: storage.getUserInfo()!.collageUuid!)
              //         : homeViewController.showGraduationItem(
              //             specialid: widget.specialId)
              );
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenWidth(3)),
            child: Obx(() {
              return CustomAppBar(
                firstText: 'controller.viewTitle[controller.pageIndex.value]',
                svgName: ' controller.viewSVG[controller.pageIndex.value]',
              );
            }),
          ),
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth(30), vertical: 0),
            child: ListView(
              children: [
                HomeTopSection(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 60.0),
                  child: Column(
                    children: [
                      30.ph,
                  CustomChipList(children: 
                  List.generate(
                          homeViewController.collegeSubjects.length,
                          (index) => CustomChipContainer(
                              text: homeViewController
                                  .collegeSubjects[index], onTap: 
                                    onTap: () {
                                // mainViewController.pageTitle.value =
                                //     signUpViewController.selectedMajor.value +
                                //         ' / ' +
                                //         homeViewController
                                //             .collegeSubjects[index].name!;

                                // context.push(BookCourseButtons(
                                //   subjectID: homeViewController
                                //       .collegeSubjects[index].uuid!,
                                //   specialID: widget.specialId,
                                // ));
                              },
                              ),
                        ),
                  )
                 ,      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: "الدورات",
                                backgroundColor: AppColors.mainBlueColor,
                                onPressed: () {
                                  // homeViewController.getLast5Exams(
                                  //     specialID: widget.specialId);
                                  // mainViewController.pageTitle.value =
                                  //     ' الدورات';
                                  // context.push(CoursesView(
                                  //     specialId: widget.specialId));
                                },
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
                                  // homeViewController.getBookQuestions(
                                  //     collegeID: signUpViewController
                                  //         .selectedValue.value);
                                  // context.push(SubjectTestView());
                                },
                                buttonTypeEnum: ButtonTypeEnum.SMALL,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
