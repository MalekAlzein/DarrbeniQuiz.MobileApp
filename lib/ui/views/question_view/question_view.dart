import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_question_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/views/question_view/result_view.dart';
import 'package:get/get.dart';

import '../../../app/app_config.dart';
import '../../../core/data/models/apis/question_model.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_app_bar.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_shimmer.dart';
import '../../shared/utils.dart';
import 'question_controller.dart';

class QuestionView extends StatefulWidget {
  final List<QuestionModel> questions;
  const QuestionView({super.key, required this.questions});

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    int temp = -1;
    return GetBuilder(
        init: QuestionsController(widget.questions),
        builder: (controller) {
          return Scaffold(
              appBar: CustomAppBar(
                activeColor: AppConfig.mainColor,
                firstText: getUserSelectedCollege,
                onTap: () {
                  Get.back();
                },
              ),
              body: CustomShimmer(
                  isLoading: controller.isShimmerLoader.value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(28),
                    ),
                    child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth(1.35),
                              bottom: screenWidth(50),
                            ),
                            child: CustomText(
                              text:
                                  '100/${(controller.spinnerValue.value * 100).toInt()}',
                              textType: TextStyleType.CUSTOM,
                              textColor: AppColors.mainblack,
                              fontSize: screenWidth(30),
                            ),
                          ),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(screenWidth(20)),
                            child: LinearProgressIndicator(
                              backgroundColor: AppColors.darkPurpleColor,
                              value: controller.spinnerValue.value,
                              color: AppColors.mainBlueColor,
                              minHeight: screenWidth(60),
                            ),
                          ),
                          SizedBox(
                            height: screenWidth(30),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: screenWidth(50)),
                                      child: controller.isShimmerLoader.value ==
                                              true
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: screenWidth(1.05),
                                                  height: screenWidth(30),
                                                  color: AppColors
                                                      .darkGreyColorTextField,
                                                ),
                                                SizedBox(
                                                  height: screenWidth(70),
                                                ),
                                                Container(
                                                  width: screenWidth(2),
                                                  height: screenWidth(30),
                                                  color: AppColors
                                                      .darkGreyColorTextField,
                                                ),
                                              ],
                                            )
                                          : CustomText(
                                              text: widget
                                                  .questions[controller
                                                      .currentQuestionIndex
                                                      .value]
                                                  .questionContent
                                                  .toString(),
                                              fontSize: screenWidth(29),
                                              textColor: AppColors.mainblack,
                                              textType: TextStyleType.CUSTOM,
                                            ),
                                    ),
                                    SizedBox(
                                      height: screenWidth(34),
                                    ),
                                    Container(
                                      height: screenWidth(0.97),
                                      child: ListView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          primary: true,
                                          shrinkWrap: true,
                                          children: widget
                                              .questions[controller
                                                  .currentQuestionIndex.value]
                                              .answers!
                                              .map((answer) {
                                            return controller.isShimmerLoader
                                                        .value ==
                                                    true
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom:
                                                            screenWidth(55)),
                                                    child: Container(
                                                      height: screenWidth(5.4),
                                                      width: screenWidth(3.5),
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .darkGreyColorTextField,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      screenWidth(
                                                                          50))),
                                                    ),
                                                  )
                                                : CustomQuestionContainer(
                                                    value: answer.id!,
                                                    selected: controller
                                                            .selectedAnswers
                                                            .value[
                                                        controller
                                                            .currentQuestionIndex
                                                            .value],
                                                    onTaped: controller
                                                                    .showAnswer[
                                                                controller
                                                                    .currentQuestionIndex
                                                                    .value] !=
                                                            -1
                                                        ? (Value) {}
                                                        : (value) {
                                                            if (temp <
                                                                controller
                                                                    .currentQuestionIndex
                                                                    .value) {
                                                              temp = controller
                                                                  .currentQuestionIndex
                                                                  .value;
                                                              controller
                                                                  .incresSlider();
                                                            }
                                                            controller
                                                                .selectAnswer(
                                                                    value!);

                                                            if (widget
                                                                    .questions[controller
                                                                        .currentQuestionIndex
                                                                        .value]
                                                                    .correctId ==
                                                                controller
                                                                        .selectedAnswers[
                                                                    controller
                                                                        .currentQuestionIndex
                                                                        .value]) {
                                                              controller
                                                                  .isCorrect(
                                                                      true);
                                                              controller
                                                                  .correctAnswers
                                                                  .value++;
                                                            } else {
                                                              controller
                                                                  .erroranswer
                                                                  .value++;
                                                            }
                                                          },
                                                    answerText: answer.text,
                                                    isVisibleAnswerResult: (answer
                                                                .id ==
                                                            controller
                                                                    .selectedAnswers
                                                                    .value[
                                                                controller
                                                                    .currentQuestionIndex
                                                                    .value])
                                                        ? controller.showAnswer[
                                                                controller
                                                                    .currentQuestionIndex
                                                                    .value] ==
                                                            controller
                                                                .currentQuestionIndex
                                                                .value
                                                        : false,
                                                    isCorrect: controller
                                                            .isCorrectAnswer[
                                                        controller
                                                            .currentQuestionIndex
                                                            .value],
                                                  );
                                          }).toList()),
                                    ),
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: screenWidth(80),
                                bottom: screenWidth(40)),
                            child: Row(
                              children: [
                                CustomIconsItem(
                                  imageName: "ic_answer_correct",
                                  colorIcon: AppColors.mainBlueColor,
                                  onTap: () {
                                    (controller.selectedAnswers[controller
                                                .currentQuestionIndex.value] !=
                                            -1)
                                        ? controller.shownAnswer(controller
                                            .currentQuestionIndex.value)
                                        : null;
                                  },
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth(30)),
                                    child: CustomIconsItem(
                                      imageHeight: screenWidth(17),
                                      imageName: 'ic_reference',
                                      onTap: () {
                                        if (controller.showAnswer[controller
                                                .currentQuestionIndex.value] !=
                                            -1) {
                                          widget
                                              .questions[controller
                                                  .currentQuestionIndex.value]
                                              .reference;
                                        }
                                      },
                                    )),
                                CustomIconsItem(
                                  imageName: controller.isSelectImportant.value
                                      ? "ic_star_selected"
                                      : "ic_star_empty",
                                  onTap: () {
                                    if (controller.isSelectImportant.value) {
                                      controller.isSelectImportant.value =
                                          false;
                                    } else {
                                      controller.isSelectImportant.value = true;
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                text: "السابق",
                                backgroundColor: AppColors.whiteColor,
                                textColor: AppColors.mainBlueColor,
                                borderColor: AppColors.mainBlueColor,
                                fontSize: screenWidth(27),
                                width: screenWidth(4.7),
                                height: screenWidth(10),
                                onPressed: () {
                                  controller.backQuestion();
                                },
                                buttonTypeEnum: ButtonTypeEnum.SMALL,
                              ),
                              CustomButton(
                                text: "التالي",
                                backgroundColor: AppColors.darkPurpleColor,
                                textColor: AppColors.whiteColor,
                                borderColor: AppColors.darkPurpleColor,
                                fontSize: screenWidth(27),
                                width: screenWidth(4.7),
                                height: screenWidth(10),
                                onPressed: () {
                                  if (controller.currentQuestionIndex.value ==
                                      widget.questions.length - 1) {
                                    Get.off(ResultView(
                                      questions: widget.questions,
                                    ));
                                  } else {
                                    controller.selectedAnswers[controller
                                                .currentQuestionIndex.value] ==
                                            -1
                                        ? null
                                        : controller.nextQuestion();
                                  }
                                },
                                buttonTypeEnum: ButtonTypeEnum.SMALL,
                              ),
                            ],
                          ),
                        ]),
                  )));
        });
  }
}

Widget CustomIconsItem(
    {required String imageName,
    required Function onTap,
    Color? colorIcon,
    double? imageHeight}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: SvgPicture.asset(
      "assets/svgs/$imageName.svg",
      color: colorIcon,
      height: imageHeight,
    ),
  );
}
