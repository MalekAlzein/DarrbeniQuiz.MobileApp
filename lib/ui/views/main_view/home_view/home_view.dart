import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_main_category.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_slider.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_subtitle_container.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());
  List<String> category = [
    'الكل',
    'الكليات الهندسية',
    'الكليات الطبية',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomShapemakerWidget(
            backButton: false,
            imageName: 'ic_nav_bar_home',
            firstText: tr("key_home")),
        Padding(
          padding: EdgeInsetsDirectional.all(screenWidth(15)),
          child: Column(children: [
            CustomSlider(),
            screenHeight(50).ph,
            CustomSubTitleContainer(
              text: tr('key_category'),
              color: AppColors.darkGreyColor,
            ),
            SizedBox(
              height: screenWidth(7),
              width: screenWidth(1),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                addAutomaticKeepAlives: true,
                addRepaintBoundaries: true,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return MainCategory(
                    category: category[index],
                    onTap: () {
                      showUpsetDialog();
                    },
                  );
                },
              ),
            )
          ]),
        ),
      ],
    );
  }
}
