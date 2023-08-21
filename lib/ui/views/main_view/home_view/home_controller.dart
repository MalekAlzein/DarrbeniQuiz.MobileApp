import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  final RxList<Widget> items = <Widget>[].obs;

  @override
  void onInit() {
    items.addAll([
      GridItem(imagePath: 'assets/svgs/ic_doctor.svg', text: 'الطب البشري')
          .toWidget(),
      GridItem(imagePath: 'assets/svgs/ic_dentist.svg', text: 'طب الأسنان')
          .toWidget(),
      GridItem(imagePath: 'assets/svgs/ic_pharmacy.svg', text: 'الصيدلة')
          .toWidget(),
      GridItem(imagePath: 'assets/svgs/ic_nursing.svg', text: 'التمريض')
          .toWidget(),
      GridItem(imagePath: 'assets/svgs/ic_It.svg', text: 'هندسة معلوماتية')
          .toWidget(),
      GridItem(
              imagePath: 'assets/svgs/ic_architecture.svg',
              text: 'هندسة معمارية')
          .toWidget(),
    ]);

    super.onInit();
  }
}

class GridItem {
  final String imagePath;
  final String text;

  GridItem({required this.imagePath, required this.text});

  Widget toWidget() {
    return Column(
      children: [
        SvgPicture.asset(imagePath),
        Text(text),
      ],
    );
  }
}
