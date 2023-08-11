import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:get/get.dart';

class ImportantQuestionsView extends StatefulWidget {
  const ImportantQuestionsView({
    super.key,
  });

  @override
  State<ImportantQuestionsView> createState() => _ImportantQuestionsViewState();
}

class _ImportantQuestionsViewState extends State<ImportantQuestionsView> {
  late ImportantQuestionsView controller = Get.put(ImportantQuestionsView());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CustomText(
            textType: TextStyleType.TITLE,
            text: 'Favorites View',
          ),
        ),
      ),
    );
  }
}
