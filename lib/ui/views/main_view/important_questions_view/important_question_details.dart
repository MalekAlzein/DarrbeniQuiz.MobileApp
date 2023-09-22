import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/core/data/models/apis/question_model.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_question_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/important_questions_view/important_questions_controller.dart';
import 'package:get/get.dart';

class ImportantQuestionDetails extends StatefulWidget {
  const ImportantQuestionDetails(
      {super.key, required this.question, required this.index});
  final QuestionModel question;
  final int index;
  @override
  State<ImportantQuestionDetails> createState() =>
      _ImportantQuestionDetailsState();
}

class _ImportantQuestionDetailsState extends State<ImportantQuestionDetails> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ImportantQuestionsController(),
      builder: (ImportantQuestionsController controller) => Scaffold(
        appBar: CustomAppBar(
          firstText: getUserSelectedCollege,
          secondText: 'الأسئلة المهمة',
          onTap: () => Get.back(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(30), vertical: screenHeight(50)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    textType: TextStyleType.BODY,
                    text: '${widget.index}. '
                        '${widget.question.questionContent}'),
                screenHeight(30).ph,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.question.answers!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomQuestionContainer(
                        answerText: widget.question.answers![index].text,
                        isCorrect: false,
                        isVisibleAnswerResult: false,
                        value: index,
                        onTaped: () {
                          // controller.selectedAnswer.value;
                        },
                        selected: controller.selectedAnswer.value);
                  },
                ),
                screenWidth(20).ph,
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          CustomToast.showMessage(
                              messageType: MessageType.WARNING,
                              message:
                                  ' لا يمكن رؤية الجواب الصحيح الا اثناء حل الاختبار');
                        },
                        child: SvgPicture.asset(
                          'assets/svgs/ic_answer_correct.svg',
                          color: AppColors.normalCyanColor,
                        )),
                    screenHeight(60).pw,
                    InkWell(
                        onTap: () {
                          // referenceDialog(context);
                        },
                        child:
                            SvgPicture.asset('assets/svgs/ic_reference.svg')),
                    screenHeight(60).pw,
                    Obx(
                      () => InkWell(
                          onTap: () {
                            controller
                                .toggleQuestionImportance(widget.question.id!);
                          },
                          child: SvgPicture.asset(!importanceService
                                  .currentQuestion.value.isImportant!
                              ? 'assets/svgs/ic_star_empty.svg'
                              : 'assets/svgs/ic_star_selected.svg')),
                    ),
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
                screenHeight(30).ph,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void referenceDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Dialog(
  //           insetPadding: EdgeInsets.all(screenWidth(30)),
  //           // shape: CircleBorder(),
  //           child: Container(
  //             alignment: Alignment.center,
  //             height: screenHeight(10),
  //             child: InkWell(
  //               onTap: () => {},
  //               child: CustomText(
  //                 text: widget.question.reference.toString(),
  //                 textType: TextStyleType.SMALL,
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
