import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/apis/question_model.dart';

import '../../shared/custom_widgets/custom_question_container.dart';
import '../../shared/custom_widgets/custom_text.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({super.key, this.questions});
  final List<QuestionModel>? questions;
  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.questions?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              CustomText(
                  textType: TextStyleType.SMALL,
                  text: widget.questions?[index].questionContent ?? ''),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.questions?[index].answers!.length,
                itemBuilder: (BuildContext context, int index2) {
                  return CustomQuestionContainer(
                      answerText:
                          widget.questions?[index].answers![index2].text,
                      isCorrect: false,
                      isVisibleAnswerResult: false,
                      value: index,
                      onTaped: () {},
                      selected: index);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
