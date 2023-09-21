import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../shared/utils.dart';
import 'about_controller.dart';

class AboutAppView extends StatefulWidget {
  const AboutAppView({super.key});

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  AboutController controller = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        firstText: 'عن التطبيق',
        onTap: () {
          Get.back();
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.onInit();
        },
        child: ListView(
          children: [
            Obx(() {
              return controller.aboutModel.value.content == null
                  ? SpinKitCircle(
                      color: AppColors.darkPurpleColor,
                    )
                  : Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth(25)),
                      child: CustomText(
                          textAlign: TextAlign.right,
                          textType: TextStyleType.BODYBIG,
                          text: controller.aboutModel.value.content!),
                    );
            })
          ],
        ),
      ),
    );
  }
}
