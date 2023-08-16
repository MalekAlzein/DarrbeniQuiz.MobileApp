import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_popup_with_blur.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

class SendFeedView extends StatefulWidget {
  const SendFeedView({super.key});

  @override
  State<SendFeedView> createState() => _SendFeedViewState();
}

class _SendFeedViewState extends State<SendFeedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Dialog(
          child: Column(
            children: [Text('data')],
          ),
        )
      ]),
    );
  }
}
