import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/core/data/models/apis/question_model.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_question_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_page_controller.dart';
import 'package:flutter_templete/ui/views/main_view/important_questions_view/important_questions_controller.dart';
import 'package:get/get.dart';

class ImportantQuestionDetails extends StatefulWidget {
  const ImportantQuestionDetails({super.key, required this.question});
  final QuestionModel question;
  @override
  State<ImportantQuestionDetails> createState() =>
      _ImportantQuestionDetailsState();
}

class _ImportantQuestionDetailsState extends State<ImportantQuestionDetails> {
  @override
  Widget build(BuildContext context) {
    ImportantQuestionsController controller =
        Get.put(ImportantQuestionsController());
    HomePageController homePageController = Get.put(HomePageController());

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenWidth(3)),
          child: CustomAppBar(
            firstText: storage
                .getSpecializationsList()[
                    storage.getTokenInfo()!.specializationId!]
                .specializationName,
            secondText: 'الأسئلة المهمة',
            onTap: () => Get.back(),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(30), vertical: screenHeight(50)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  textType: TextStyleType.BODY,
                  text: '${widget.question.id}. '
                      '${widget.question.questionContent}'),
              screenHeight(30).ph,
              Obx(() {
                print(controller.selectedAnswer.value);
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.question.answers!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomQuestionContainer(
                        answerText: widget.question.answers![index].text,
                        isCorrect: false,
                        isVisibleAnswerResult: false,
                        value: index,
                        onTaped: () {
                          controller.selectedAnswer.value;
                        },
                        selected: controller.selectedAnswer.value);
                  },
                );
              }),
              10.ph,
              Row(
                children: [
                  InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/svgs/ic_answer_correct.svg',
                        color: AppColors.normalCyanColor,
                      )),
                  15.pw,
                  InkWell(
                      onTap: () {
                        referenceDialog(context);
                      },
                      child: SvgPicture.asset('assets/svgs/ic_reference.svg')),
                  15.pw,
                  InkWell(
                      onTap: () {
                        controller.isImportant.isTrue
                            ? controller
                                .removeFromImportants(widget.question.id!)
                            : controller.addToImportants(widget.question.id!);

                        controller.isImportant.value =
                            !controller.isImportant.value;
                      },
                      child: SvgPicture.asset(controller.isImportant.isFalse
                          ? 'assets/svgs/ic_star_empty.svg'
                          : 'assets/svgs/ic_star_selected.svg')),
                ],
              ),
              SizedBox(height: screenHeight(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    width: screenWidth(5),
                    onPressed: () {},
                    text: 'السابق',
                    borderColor: AppColors.darkPurpleColor,
                    textColor: AppColors.darkPurpleColor,
                    backgroundColor: AppColors.whiteColor,
                    buttonTypeEnum: ButtonTypeEnum.CUSTOM,
                  ),
                  CustomButton(
                    width: screenWidth(5),
                    onPressed: () {},
                    text: 'التالي',
                    borderColor: AppColors.normalCyanColor,
                    textColor: AppColors.whiteColor,
                    backgroundColor: AppColors.normalCyanColor,
                    buttonTypeEnum: ButtonTypeEnum.CUSTOM,
                  ),
                ],
              ),
              30.ph,
            ],
          ),
        ),
      ),
    );
  }

  void referenceDialog(BuildContext context) {
    Get.defaultDialog(
      barrierDismissible: true,
      // context: context,
      content: Container(
        alignment: Alignment.center,
        height: screenHeight(10),
        child: CustomText(
          text: widget.question.reference.toString(),
          textType: TextStyleType.SMALL,
        ),
      ),
      // builder: (BuildContext context) {
      //   return Dialog(
      //     insetPadding: EdgeInsets.all(screenWidth(30)),
      //     // shape: CircleBorder(),
      //     child: Container(
      //       alignment: Alignment.center,
      //       height: screenHeight(10),
      //       child: CustomText(
      //         text: widget.question.reference.toString(),
      //         textType: TextStyleType.SMALL,
      //       ),
      //     ),
      //   );
      // }
    );
  }
}
