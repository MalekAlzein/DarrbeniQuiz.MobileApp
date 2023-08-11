import 'package:flutter/material.dart';
import 'package:flutter_templete/core/enums/bottom_Navigation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/custom_navigation_item_widget.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({
    super.key,
    required this.bottomNavigationEnum,
    required this.onTap,
  });

  final BottomNavigationEnum bottomNavigationEnum;
  final Function(BottomNavigationEnum, int) onTap;

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: screenWidth(1),
          height: screenWidth(6),
          // height: screenHeight(10),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(
              color: AppColors.blackColor,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          start: 0,
          end: 0,
          child: Container(
            height: screenWidth(6),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenWidth(45),
                horizontal: screenWidth(23),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavItemWidget(
                    imageName: 'ic_nav_bar_profile',
                    // text: tr('main_view_bottom_navigation_bar_item_mycard'),
                    isSelected: widget.bottomNavigationEnum ==
                        BottomNavigationEnum.PROFILE,
                    onTap: () {
                      widget.onTap(BottomNavigationEnum.PROFILE, 0);
                    },
                  ),
                  NavItemWidget(
                    imageName: 'ic_nav_bar_important_questions',
                    // text: tr('main_view_bottom_navigation_bar_item_home'),
                    isSelected: widget.bottomNavigationEnum ==
                        BottomNavigationEnum.IMPORTANT_QUESTIONS,
                    onTap: () {
                      widget.onTap(BottomNavigationEnum.IMPORTANT_QUESTIONS, 1);
                    },
                  ),
                  NavItemWidget(
                    imageName: 'ic_nav_bar_home',
                    // text: tr('main_view_bottom_navigation_bar_item_setting'),
                    isSelected: widget.bottomNavigationEnum ==
                        BottomNavigationEnum.HOME,
                    onTap: () {
                      widget.onTap(BottomNavigationEnum.HOME, 2);
                    },
                  ),
                  NavItemWidget(
                    imageName: 'ic_nav_bar_notifications',
                    // text: tr('main_view_bottom_navigation_bar_item_setting'),
                    isSelected: widget.bottomNavigationEnum ==
                        BottomNavigationEnum.NOTIFICATIONS,
                    onTap: () {
                      widget.onTap(BottomNavigationEnum.NOTIFICATIONS, 3);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
