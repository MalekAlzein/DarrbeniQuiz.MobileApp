import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/app/app_config.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_chip_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_chip_list.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_subtitle_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/course_details_view/book_terms_buttons_view.dart';
import 'package:flutter_templete/ui/views/course_details_view/subject_view_controller.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_page_controller.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_view_widgets/home_top_section.dart';
import 'package:flutter_templete/ui/views/register_view/register_controller.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_app_bar.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/utils.dart';
import '../question_view/question_view.dart';

class SubjectView extends StatefulWidget {
  const SubjectView({super.key, this.master = false});
  final bool? master;
  @override
  State<SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  SubjectViewController courseDetailsController =
      Get.put(SubjectViewController());
  RegisterController registerController = Get.put(RegisterController());
  HomePageController homeController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return
        // onRefresh: () {
        //     return Future(() {
        //       widget.master!
        //           ? homeController.getMasterSubjects()
        //           : homeController.getGraduationSubjects();
        //       homeController.getSubjects(
        //           specialID: storage.getTokenInfo()!.specialization!.id!);
        //       homeController.getAllSliders();
        //     });
        //   },
        Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenWidth(3)),
        child: Obx(() {
          print(courseDetailsController.questions);
          return CustomAppBar(
            onTap: () => Get.back(),
            activeColor: AppConfig.mainColor,
            firstText: getUserSelectedCollege,
          );
        }),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(30),
        ),
        child: Obx(
          () => ListView(
            shrinkWrap: true,
            children: [
              HomeTopSection(),
              CustomSubTitleContainer(
                text: tr('key_category'),
                color: AppColors.darkGreyColor,
              ),
              screenHeight(30).ph,
              homeController.isSubjectsLoading
                  ? SpinKitCircle(
                      color: AppColors.darkPurpleColor,
                    )
                  : homeController.subjects.isEmpty
                      ? Center(
                          child: CustomText(
                            textType: TextStyleType.CUSTOM,
                            text: 'No subject yet',
                            textColor: AppColors.darkPurpleColor,
                          ),
                        )
                      : Center(
                          child: CustomChipList(
                            direction: homeController.subjects.length < 4
                                ? Axis.vertical
                                : Axis.horizontal,
                            children: List.generate(
                              homeController.subjects.length,
                              (index) => CustomChipContainer(
                                text: homeController.subjects[index].name ?? '',
                                onTap: () {
                                  Get.to(BookCourseButtons(
                                    subject: homeController.subjects[index],
                                  ));
                                },
                              ),
                            ),
                          ),
                        ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenWidth(7), horizontal: screenWidth(7)),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: tr("Key_terms"),
                        backgroundColor: AppColors.normalCyanColor,
                        onPressed: () {
                          //Get.to(TermsView(
                          //     specialId: widget.specialId));
                        },
                        fontSize: screenWidth(27),
                        buttonTypeEnum: ButtonTypeEnum.SMALL,
                      ),
                    ),
                    30.pw,
                    Expanded(
                      child: CustomButton(
                        text: tr("Key_questions_bank"),
                        onPressed: () {
                          courseDetailsController
                              .getBankQuestions(
                                  specialid: storage
                                      .getTokenInfo()!
                                      .specialization!
                                      .id!)
                              .then((value) => Get.to(QuestionView(
                                    questions:
                                        courseDetailsController.questions,
                                  )));
                        },
                        fontSize: screenWidth(27),
                        buttonTypeEnum: ButtonTypeEnum.SMALL,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
