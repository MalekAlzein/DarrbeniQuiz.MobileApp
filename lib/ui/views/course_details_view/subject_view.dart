import 'package:flutter/material.dart';
import 'package:flutter_templete/app/app_config.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_chip_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_chip_list.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_subtitle_container.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/course_details_view/book_terms_buttons_view.dart';
import 'package:flutter_templete/ui/views/course_details_view/subject_view_controller.dart';
import 'package:flutter_templete/ui/views/course_details_view/subjects_shimmer.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_page_controller.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_view_widgets/home_top_section.dart';
import 'package:flutter_templete/ui/views/register_view/register_controller.dart';
import 'package:get/get.dart';
import '../../../core/enums/terms_type.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_app_bar.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_text.dart';
import '../../shared/utils.dart';
import '../question_view/question_view.dart';
import '../years_questions_view/years_questions_view.dart';

class SubjectView extends StatefulWidget {
  const SubjectView({super.key, this.master = false, this.grad = false});
  final bool? master;
  final bool? grad;
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
    return RefreshIndicator(
      onRefresh: () {
        return Future(() {
          widget.master!
              ? homeController.getMasterSubjects()
              : widget.grad!
                  ? homeController.getGraduationSubjects()
                  : homeController.getSubjects(
                      specialID: homeController.subbedSpecialization);
          homeController.getAllSliders();
        });
      },
      child: Scaffold(
        appBar: CustomAppBar(
          onTap: () => Get.back(closeOverlays: true),
          activeColor: AppConfig.mainColor,
          firstText: getUserSelectedCollege,
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
                    ? SubjectsShimmer()
                    : homeController.subjects.isEmpty
                        ? Center(
                            child: CustomText(
                              textType: TextStyleType.CUSTOM,
                              text: tr('key_no_subjects'),
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
                                  text:
                                      homeController.subjects[index].name ?? '',
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
                            Get.to(YearsQuestionsView(
                              subjectId: 0,
                              termsType: TermsType.ALL_SUBJECTS,
                            ));
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
                                    specialid:
                                        homeController.subbedSpecialization)
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
      ),
    );
  }
}
