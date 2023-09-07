// import 'package:flutter/material.dart';
// import 'package:flutter_templete/ui/views/question_view/question_controller.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// import '../../shared/colors.dart';
// import '../../shared/custom_widgets/custom_button.dart';
// import '../../shared/custom_widgets/custom_question_container.dart';
// import '../../shared/custom_widgets/custom_text.dart';
// import '../../shared/utils.dart';

// class ResultView extends StatefulWidget {
//   const ResultView({super.key});

//   @override
//   State<ResultView> createState() => _ResultViewState();
// }

// class _ResultViewState extends State<ResultView> {
//   QuestionsController controller = Get.put(QuestionsController());
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//           () => SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   child: Lottie.asset('assets/lottie/ic_cup.json',
//                       height: screenWidth(3), width: screenWidth(2)),
//                 ),
//                 Text(
//                   "مبروك لقد أتممت الاختبار بنجاح ",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: screenWidth(23)),
//                 ),
//                 Text("علامتك هي : ${controller.correctAnswers}/100",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: screenWidth(23))),
//                 SizedBox(
//                   height: screenWidth(20),
//                 ),
//                 Divider(
//                   thickness: 2,
//                   color: AppColors.mainblack,
//                   indent: 70,
//                   endIndent: 90,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: screenWidth(5)),
//                   child: Column(
//                     children: [
//                       Text(
//                           "عدد الاسئلة الصحيحة :${controller.correctAnswers}\nعدد الاسئلة الخاطئة :${controller.erroranswer}",
//                           style: TextStyle(
//                               color: AppColors.mainblack,
//                               fontSize: screenWidth(24))),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: screenWidth(18),
//                 ),
//                 CustomButton(
//                   onPressed: () {
//                     controller.showResult.value = true;
//                   },
//                   text: "التحقق من الاجابات",
//                   fontSize: screenWidth(23),
//                   width: screenWidth(1.8),
//                   height: screenWidth(8),
//                    buttonTypeEnum:ButtonTypeEnum.NORMAL,
//                 ),
//                 Visibility(
//                   visible: controller.showResult.value,
//                   child: ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: controller.questionList.length,
//                       shrinkWrap: true,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Padding(
//                           padding:
//                               EdgeInsets.symmetric(vertical: screenWidth(20)),
//                           child: Column(children: [
//                             CustomText(
//                               text:
//                                   controller.questionList[index].questionContent!,
                             
//                               fontSize: screenWidth(29),
//                               textColor: AppColors.mainblack,
//                               textType: TextStyleType.CUSTOM,
//                             ),
//                             SizedBox(
//                               height: screenWidth(30),
//                             ),
//                             Column(
//                               children: List.generate(5, (index1) {
//                                 return CustomQuestionContainer(
//                                   value: controller
//                                       .questionList[index].answers![index1].id!,
//                                   selected: controller.selectedAnswers[index1],
//                                   onTaped: (Value) {},
//                                   answerText: controller.questionList[index]
//                                       .answers![index1].text,
//                                   isCorrect: controller.isCorrectAnswer[index1],
//                                   isVisibleAnswerResult: (controller
//                                               .isCorrectAnswer[index1] ||
//                                           controller.selectedAnswers[index1] !=
//                                               -1)
//                                       ? true
//                                       : false,
//                                 );
//                               }),
//                             ),
//                           ]),
//                         );
//                       }),
//                 ),
//               ],
//             ),
//           ),
//         );
//   }
// }