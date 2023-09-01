import 'package:flutter_templete/core/enums/bottom_Navigation.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

class BottomNavigationController extends BaseController {
  BottomNavigationController(BottomNavigationEnum type) {
    enumType.value = type;
  }
  Rx<BottomNavigationEnum> enumType = BottomNavigationEnum.HOME.obs;
}