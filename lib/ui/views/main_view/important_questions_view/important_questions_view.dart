import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/views/main_view/important_questions_view/important_questions_controller.dart';
import 'package:get/get.dart';

class ImportantQuestionsView extends StatefulWidget {
  const ImportantQuestionsView({
    super.key,
  });

  @override
  State<ImportantQuestionsView> createState() => _ImportantQuestionsViewState();
}

class _ImportantQuestionsViewState extends State<ImportantQuestionsView> {
  ImportantQuestionsController controller =
      Get.put(ImportantQuestionsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          CustomContainer(
              text: '1. الخدمة بأفضل جهد في بروتوكول الانترنت IPV4 تعني ان :',
              textColor: AppColors.darkGreyColor,
              textType: TextStyleType.SMALL),
        ],
      )),
    );
  }
}
