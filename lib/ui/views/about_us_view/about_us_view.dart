import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/views/about_us_view/about_us_controller.dart';
import 'package:get/get.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({
    super.key,
  });

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  AboutUsController controller = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CustomText(
            textType: TextStyleType.TITLE,
            text: 'About Us',
          ),
        ),
      ),
    );
  }
}
