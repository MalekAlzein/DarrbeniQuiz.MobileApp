import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:flutter_templete/ui/views/question_view/question_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../app/app_config.dart';
import '../../../core/data/models/apis/question_model.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_question_container.dart';
import '../../shared/custom_widgets/custom_text.dart';
import '../../shared/utils.dart';

class ResultView extends StatefulWidget {
  final List<QuestionModel> questions;
  const ResultView({super.key, required this.questions});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    QuestionsController controller =
        Get.put(QuestionsController(widget.questions));
    return Scaffold(
      appBar: CustomAppBar(
        activeColor: AppConfig.mainColor,
        firstText: controller.showResult.value ? 'الاجابات' : 'النتيجة',
        onTap: () {
          Get.back();
        },
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Lottie.asset('assets/lottie/ic_cup.json',
                    height: screenWidth(3), width: screenWidth(2)),
              ),
              Text(
                "مبروك لقد أتممت الاختبار بنجاح ",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: screenWidth(23)),
              ),
              Text("علامتك هي : ${controller.correctAnswers}/100",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: screenWidth(23))),
              SizedBox(
                height: screenWidth(20),
              ),
              Divider(
                thickness: 2,
                color: AppColors.mainblack,
                indent: 70,
                endIndent: 90,
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth(5)),
                child: Column(
                  children: [
                    Text(
                        "عدد الاسئلة الصحيحة :${controller.correctAnswers}\nعدد الاسئلة الخاطئة :${controller.erroranswer}",
                        style: TextStyle(
                            color: AppColors.mainblack,
                            fontSize: screenWidth(24))),
                  ],
                ),
              ),
              SizedBox(
                height: screenWidth(18),
              ),
              CustomButton(
                onPressed: () {
                  controller.showResult.value = true;
                },
                text: "التحقق من الاجابات",
                fontSize: screenWidth(23),
                width: screenWidth(1.8),
                height: screenWidth(8),
                buttonTypeEnum: ButtonTypeEnum.NORMAL,
              ),
              Visibility(
                visible: controller.showResult.value,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.questions.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenWidth(20)),
                        child: Column(children: [
                          CustomText(
                            text: widget.questions[index].questionContent!,
                            fontSize: screenWidth(29),
                            textColor: AppColors.mainblack,
                            textType: TextStyleType.CUSTOM,
                          ),
                          SizedBox(
                            height: screenWidth(30),
                          ),
                          Column(
                            children: List.generate(
                                widget.questions[index].answers!.length,
                                (index1) {
                              return CustomQuestionContainer(
                                answerText: widget
                                    .questions[index].answers![index1].text!,
                                value: widget
                                    .questions[index].answers![index1].id!,
                                selected: (widget.questions[index].correctId ==
                                            index1 + 1 ||
                                        controller.selectedAnswers[index] ==
                                            index1 + 1)
                                    ? index1 + 1
                                    : -1,
                                isCorrect: widget.questions[index].correctId ==
                                    index1 + 1,
                                isVisibleAnswerResult:
                                    (widget.questions[index].correctId ==
                                            index1 + 1 ||
                                        controller.selectedAnswers[index] ==
                                            index1 + 1),
                                onTaped: () {},
                              );
                            }),
                          ),
                        ]),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
