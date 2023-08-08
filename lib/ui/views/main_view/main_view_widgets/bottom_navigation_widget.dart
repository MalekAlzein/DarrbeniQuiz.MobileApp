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
                    imageName: 'ic_nav_bar_favorites',
                    // text: tr('main_view_bottom_navigation_bar_item_home'),
                    isSelected: widget.bottomNavigationEnum ==
                        BottomNavigationEnum.FAVORITES,
                    onTap: () {
                      widget.onTap(BottomNavigationEnum.FAVORITES, 1);
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

  // Widget navItem({
  //   required String text,
  //   required String imageName,
  //   required bool isSelected,
  //   required Function onTap,
  // }) {
  //   return InkWell(
  //     onTap: () {
  //       onTap();
  //     },
  //     child: Column(
  //       children: [
  //         SvgPicture.asset(
  //           'assets/images/$imageName.svg',
  //           color: isSelected ? AppColors.blackColor : AppColors.grey,
  //           width: screenWidth(17),
  //           height: screenWidth(17),
  //         ),

  //         verSpace(35),
  // Text(
  //   text,
  //   style: TextStyle(
  //     color: isSelected
  //         ? AppColors.mainOrangeColor
  //         : AppColors.placeholderGreyColor,
  //     fontSize: screenWidth(30),
  //   ),
  // )
  // ],
  //     ),
  //   );
  // }
}

// class BottomNavigationClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path0 = Path();
//     path0.moveTo(0, 0);
//     path0.lineTo(size.width * 0.3381500, 0);
//     path0.quadraticBezierTo(size.width * 0.3731500, size.height * 0.0069000,
//         size.width * 0.3757000, size.height * 0.1236000);
//     path0.quadraticBezierTo(size.width * 0.4022000, size.height * 0.5633000,
//         size.width * 0.5006000, size.height * 0.5896000);
//     path0.quadraticBezierTo(size.width * 0.5955500, size.height * 0.5727000,
//         size.width * 0.6200000, size.height * 0.1240000);
//     path0.quadraticBezierTo(size.width * 0.6204500, size.height * -0.0157000,
//         size.width * 0.6646000, 0);
//     path0.lineTo(size.width, 0);
//     path0.lineTo(size.width, size.height);
//     path0.lineTo(0, size.height);
//     path0.lineTo(0, 0);
//     path0.lineTo(size.width * 0.6225000, size.height * 0.6100000);
//     return path0;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
// }

// class _ClipShadowShadowPainter extends CustomPainter {
//   final Shadow shadow;
//   final CustomClipper<Path> clipper;

//   _ClipShadowShadowPainter({required this.shadow, required this.clipper});

//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = shadow.toPaint();
//     var clipPath = clipper.getClip(size).shift(shadow.offset);
//     canvas.drawPath(clipPath, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
