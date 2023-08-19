import 'package:flutter/material.dart';
import 'package:flutter_templete/core/enums/bottom_Navigation.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';

import 'package:get/get.dart';

class MainController extends BaseController {
  Rx<BottomNavigationEnum> selectedPage = BottomNavigationEnum.HOME.obs;
  PageController pageController = PageController(initialPage: 2);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxString headerName = "".obs;
  RxString headerImage = "".obs;

  @override
  void onInit() {
    headerName.value = tr("key_home");
    headerImage.value = "ic_nav_bar_home";
    super.onInit();
  }

  void changeValueUsingEnum({
    required BottomNavigationEnum selectedEnum,
  }) {
    selectedPage.value = selectedEnum;
    switch (selectedEnum) {
      case BottomNavigationEnum.NOTIFICATIONS:
        headerName.value = tr("key_notifications");
        headerImage.value = "ic_nav_bar_notifications";
        break;
      case BottomNavigationEnum.HOME:
        headerName.value = tr("key_home");
        headerImage.value = "ic_nav_bar_home";
        break;
      case BottomNavigationEnum.IMPORTANT_QUESTIONS:
        headerName.value = tr("key_important_questions");
        headerImage.value = "ic_nav_bar_important_questions";
        break;
      case BottomNavigationEnum.PROFILE:
        headerName.value = tr("key_profile");
        headerImage.value = "ic_nav_bar_profile";
        break;
    }
  }

  void pageNavigation(BottomNavigationEnum selectedEnum, int pageNumber) {
    pageController.animateToPage(
      pageNumber,
      duration: Duration(
        microseconds: 500,
      ),
      curve: Curves.easeInCirc,
    );
    // selectedPage.value = selectedEnum;
    changeValueUsingEnum(selectedEnum: selectedEnum);
  }
}
