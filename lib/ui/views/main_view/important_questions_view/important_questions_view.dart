import 'package:flutter/material.dart';

class ImportantQuestionsView extends StatefulWidget {
  const ImportantQuestionsView({Key? key}) : super(key: key);

  @override
  State<ImportantQuestionsView> createState() => _ImportantQuestionsViewState();
}

class _ImportantQuestionsViewState extends State<ImportantQuestionsView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Important Questions'),
    );
  }
}
