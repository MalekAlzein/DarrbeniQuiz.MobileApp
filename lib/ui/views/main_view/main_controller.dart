import 'package:flutter/material.dart';
import 'package:flutter_templete/core/enums/bottom_Navigation.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  PageController pageController = PageController(initialPage: 1);
  late Rx<BottomNavigationEnum> selected = BottomNavigationEnum.HOME.obs;

  RxList<String> viewTitle = <String>[
    'الإشعارات',
    'الرئيسية',
    'الأسئلة المهمة',
    'الملف الشخصي',
  ].obs;

  RxList<String> viewSVG = <String>[
    'ic_nav_bar_notifications',
    'ic_nav_bar_home',
    'ic_nav_bar_important_questions',
    'ic_nav_bar_profile',
  ].obs;

  RxInt pageIndex = 1.obs;

  void onClick(BottomNavigationEnum select, int pageNumber) {
    selected.value = select;
    pageController.jumpToPage(pageNumber);
    pageIndex.value = pageNumber;
  }

  void updateTitleAndSVG(int pageNumber) {
    switch (pageNumber) {
      case 0:
        viewTitle[pageNumber] = "الإشعارات";
        viewSVG[pageNumber] = "ic_nav_bar_notifications";
        pageIndex.value =0;
        break;
      case 1:
        viewTitle[pageNumber] = "الرئيسية";
        viewSVG[pageNumber] = "ic_nav_bar_home";
        pageIndex.value =1;
        break;
      case 2:
        viewTitle[pageNumber] = "الأسئلة المهمة";
        viewSVG[pageNumber] = "ic_nav_bar_important_questions";
        pageIndex.value =2;
        break;
      case 3:
        viewTitle[pageNumber] = "الملف الشخصي";
        viewSVG[pageNumber] = "ic_nav_bar_profile";
        pageIndex.value =3;
        break;
      default:
        break;
    }
  }

}