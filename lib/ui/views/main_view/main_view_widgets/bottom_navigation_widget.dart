import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/enums/bottom_Navigation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_overalay.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/bottom_navigation_controller.dart';
import 'package:get/get.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigation;
  final Function(BottomNavigationEnum, int) onTap;

  const BottomNavigationWidget(
      {super.key, required this.bottomNavigation, required this.onTap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  late BottomNavigationController controller;
  @override
  void initState() {
    controller = BottomNavigationController(widget.bottomNavigation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth(1),
        height: screenWidth(6),
        color: AppColors.whiteColor,
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.PROFILE, 3);
                    controller.enumType.value = BottomNavigationEnum.PROFILE;
                  },
                  imageName: "ic_nav_bar_profile",
                  isSelected: controller.enumType.value ==
                      BottomNavigationEnum.PROFILE),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.IMPORTANT_QUESTIONS, 2);
                    controller.enumType.value =
                        BottomNavigationEnum.IMPORTANT_QUESTIONS;
                  },
                  imageName: "ic_nav_bar_important_questions",
                  isSelected: controller.enumType.value ==
                      BottomNavigationEnum.IMPORTANT_QUESTIONS),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.HOME, 1);
                    controller.enumType.value = BottomNavigationEnum.HOME;
                  },
                  imageName: "ic_nav_bar_home",
                  isSelected:
                      controller.enumType.value == BottomNavigationEnum.HOME),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.NOTIFICATIONS, 0);
                    controller.enumType.value =
                        BottomNavigationEnum.NOTIFICATIONS;
                  },
                  imageName: "ic_nav_bar_notifications",
                  isSelected: controller.enumType.value ==
                      BottomNavigationEnum.NOTIFICATIONS),
            ],
          );
        }));
  }

  Widget navItem({
    required String imageName,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        storage.isLoggedIn ? onTap() : showCustomAlertDialog();
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: screenWidth(30)),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/svgs/$imageName.svg",
              width: isSelected ? screenWidth(15) : screenWidth(18),
              color: AppColors.normalPurpleColor,
            ),
            SizedBox(
              height: screenWidth(100),
            ),
            Container(
              width: screenWidth(10),
              height: screenWidth(200),
              color:
                  isSelected ? AppColors.normalPurpleColor : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
