import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shimmer.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/main_view/important_questions_view/important_question_details.dart';
import 'package:flutter_templete/ui/views/main_view/important_questions_view/important_questions_controller.dart';
import 'package:get/get.dart';

import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_text.dart';
import '../../../shared/utils.dart';

class ImportantQuestionsView extends StatefulWidget {
  const ImportantQuestionsView({Key? key}) : super(key: key);

  @override
  State<ImportantQuestionsView> createState() => _ImportantQuestionsViewState();
}

class _ImportantQuestionsViewState extends State<ImportantQuestionsView> {
  @override
  Widget build(BuildContext context) {
    ImportantQuestionsController controller =
        Get.put(ImportantQuestionsController());

    return RefreshIndicator(
      onRefresh: () {
        return controller.getImportantQuestions();
      },
      child: Obx(
        () => controller.isImportantQuestionsLoading
            ? SpinKitCircle(
                color: AppColors.darkPurpleColor,
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenHeight(80), vertical: screenHeight(30)),
                child: ListView(
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: 100,
                            height: 50,
                            color: AppColors.darkGreyColorTextField,
                            child: InkWell(
                              onTap: () {
                                Get.to((ImportantQuestionDetails(
                                  question:
                                      controller.importantQuestions[index],
                                )));
                              },
                              child: CustomShimmer(
                                isLoading:
                                    controller.isImportantQuestionsLoading,
                                center: true,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: CustomText(
                                        textAlign: TextAlign.start,
                                        text:
                                            '${controller.importantQuestions[index].id.toString()}   ${controller.importantQuestions[index].questionContent}',
                                        fontSize: screenWidth(27),
                                        textType: TextStyleType.CUSTOM,
                                      ),
                                    ),
                                    InkWell(
                                      child: SvgPicture.asset(
                                          "assets/svgs/ic_arrow.svg"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return 20.ph;
                        },
                        itemCount: controller.importantQuestions.length)
                  ],
                ),
              ),
      ),
    );
  }
}
