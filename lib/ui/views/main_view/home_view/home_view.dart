import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shapemaker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_slider.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_subtitle_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomShapemakerWidget(),
        Padding(
          padding: EdgeInsetsDirectional.all(screenWidth(15)),
          child: Column(children: [
            CustomSlider(),
            // CarouselSlider(
            //   options: CarouselOptions(height: 400.0),
            //   items: [1, 2, 3, 4, 5].map((i) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //         return Container(
            //             width: MediaQuery.of(context).size.width,
            //             margin: EdgeInsets.symmetric(horizontal: 5.0),
            //             decoration: BoxDecoration(color: Colors.amber),
            //             child: Text(
            //               'text $i',
            //               style: TextStyle(fontSize: 16.0),
            //             ));
            //       },
            //     );
            //   }).toList(),
            // ),
            CustomSubTitleContainer(
              text: 'التصنيفات',
            ),
          ]),
        ),
      ],
    );
  }
}
