import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
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
        onTap: (){
          Get.back();
        },
      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [

          SvgPicture.asset('assets/svgs/about_app.svg'),

          (screenWidth(30)).ph,

          Obx(() {
            return controller.aboutModel.value.data == null ? SpinKitCircle(color: AppColors.darkPurpleColor,) :
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.aboutModel.value.data!.length,
                  itemBuilder: (context , index) {
                    return CustomText(
                        textType: TextStyleType.BODYBIG,
                        text: controller.aboutModel.value.data![index].content ?? '');
                  }
                );
          })
        ],
      ),
    );
  }
}
