import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/main_view/important_questions_view/important_question_details.dart';
import 'package:flutter_templete/ui/views/main_view/important_questions_view/important_questions_controller.dart';
import 'package:flutter_templete/ui/views/main_view/important_questions_view/important_questions_shimmer.dart';
import 'package:get/get.dart';

import '../../../../core/translation/app_translation.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_text.dart';
import '../../../shared/utils.dart';

class ImportantQuestionsView extends StatefulWidget {
  const ImportantQuestionsView({Key? key}) : super(key: key);

  @override
  State<ImportantQuestionsView> createState() => _ImportantQuestionsViewState();
}

class _ImportantQuestionsViewState extends State<ImportantQuestionsView> {
  ImportantQuestionsController controller =
      Get.put(ImportantQuestionsController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future(() {
          controller.getImportantQuestions();
        });
      },
      child: Obx(
        () => controller.isImportantQuestionsLoading
            ? ImportantQuestionsShimmer()
            : controller.importantQuestions.isEmpty
                ? ListView(
                    children: [
                      Center(
                        child: CustomText(
                            textType: TextStyleType.CUSTOM,
                            text: tr('key_empty_important')),
                      ),
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenHeight(80),
                        vertical: screenHeight(30)),
                    child: ListView(
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth(30)),
                                width: screenWidth(30),
                                height: screenHeight(15),
                                color: AppColors.darkGreyColorTextField,
                                child: InkWell(
                                  onTap: () {
                                    importanceService.setcurrentQuestion =
                                        controller.importantQuestions[index];

                                    Get.to((ImportantQuestionDetails(
                                      index: index + 1,
                                      question:
                                          controller.importantQuestions[index],
                                    )));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: CustomText(
                                          textAlign: TextAlign.start,
                                          text:
                                              '${index + 1}   ${controller.importantQuestions[index].questionContent}',
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
                              );
                            },
                            separatorBuilder: (context, index) {
                              return screenHeight(20).ph;
                            },
                            itemCount: controller.importantQuestions.length)
                      ],
                    ),
                  ),
      ),
    );
  }
}
