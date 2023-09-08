import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/years_questions_view/years_questions_controller.dart';
import 'package:flutter_templete/ui/views/years_questions_view/years_questions_shimmer.dart';
import 'package:get/get.dart';

import '../../../app/app_config.dart';
import '../../../core/enums/terms_type.dart';
import '../../shared/custom_widgets/custom_text.dart';
import '../../shared/utils.dart';

class YearsQuestionsView extends StatefulWidget {
  const YearsQuestionsView(
      {super.key, required this.subjectId, required this.termsType});
  final int subjectId;
  final TermsType termsType;

  @override
  State<YearsQuestionsView> createState() => _YearsQuestionsViewState();
}

class _YearsQuestionsViewState extends State<YearsQuestionsView> {
  late YearsQuestionsController controller;
  @override
  void initState() {
    controller = Get.put(YearsQuestionsController(
        subjectId: widget.subjectId, termsType: widget.termsType));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        activeColor: AppConfig.mainColor,
        svgName: "ic_back",
        onTap: () {
          Get.back();
        },
        firstText: "الدورات",
      ),
      body: Obx(() {
        return controller.isLoading
            ? YearsQuestionsShimmer()
            : Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: screenWidth(25)),
                child: ListView(
                    children: controller.yearsQuestionsList.map((element) {
                  return Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        vertical: screenWidth(30)),
                    child: InkWell(
                      onTap: () {
                        controller.getQuestions(termId: element.id!);
                      },
                      child: Container(
                        height: screenHeight(20),
                        decoration: BoxDecoration(
                          color:
                              controller.yearsQuestionsList.indexOf(element) %
                                          2 ==
                                      0
                                  ? AppColors.lightPurpleColor
                                  : AppColors.lightCyanColor,
                          borderRadius: BorderRadius.circular(screenWidth(50)),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                              horizontal: screenWidth(40)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svgs/ic_reference.svg',
                                    width: screenWidth(20),
                                  ),
                                  screenWidth(25).pw,
                                  CustomText(
                                      textType: TextStyleType.SUBTITLE,
                                      text: element.termName!)
                                ],
                              ),
                              SvgPicture.asset(
                                'assets/svgs/ic_arrow.svg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList()),
              );
      }),
    );
  }
}
