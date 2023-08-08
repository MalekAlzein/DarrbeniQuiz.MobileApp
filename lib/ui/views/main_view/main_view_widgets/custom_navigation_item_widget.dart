import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class NavItemWidget extends StatefulWidget {
  const NavItemWidget({
    super.key,
    this.count,
    this.text,
    required this.imageName,
    required this.isSelected,
    required this.onTap,
  });
  final int? count;
  final String? text;
  final String? imageName;
  final bool? isSelected;
  final Function? onTap;

  @override
  State<NavItemWidget> createState() => _NavItemTestWidgetState();
}

class _NavItemTestWidgetState extends State<NavItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: screenWidth(4.25),
        height: screenWidth(7.75),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(23),
          color: widget.isSelected!
              ? AppColors.darkPurpleColor
              : AppColors.lightPurpleColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svgs/${widget.imageName}.svg',
              color: widget.isSelected!
                  ? AppColors.whiteColor
                  : AppColors.darkPurpleColor,
              width: screenWidth(12),
              height: screenWidth(12),
            ),
            if (widget.text != null) ...[
              (screenHeight(100)).ph,
              CustomText(
                textType: TextStyleType.CUSTOM,
                text: widget.text ?? "",
                textColor: widget.isSelected!
                    ? AppColors.blackColor
                    : AppColors.lightCyanColor,
                fontSize: screenHeight(60),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttergetxframework/UI/shared/colors.dart';
// import 'package:fluttergetxframework/UI/shared/custom_widgets/custom_text.dart';
// import 'package:fluttergetxframework/core/utils/general_utils.dart';

// class NavItemWidget extends StatefulWidget {
//   const NavItemWidget({
//     super.key,
//     this.count,
//     this.text,
//     required this.imageName,
//     required this.isSelected,
//     required this.onTap,
//   });
//   final int? count;
//   final String? text;
//   final String? imageName;
//   final bool? isSelected;
//   final Function? onTap;

//   @override
//   State<NavItemWidget> createState() => _NavItemTestWidgetState();
// }

// class _NavItemTestWidgetState extends State<NavItemWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         widget.onTap!();
//       },
//       child: Container(
//         alignment: AlignmentDirectional.center,
//         width: screenWidth(8),
//         decoration: BoxDecoration(
//           color: AppColors.fillColorButtonIcon,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 SvgPicture.asset(
//                   'assets/svgs/${widget.imageName}.svg',
//                   color: widget.isSelected!
//                       ? AppColors.blackColor
//                       : AppColors.grey,
//                   width: screenWidth(12),
//                   height: screenWidth(12),
//                 ),
//                 PositionedDirectional(
//                   bottom: -screenWidth(100),
//                   end: -screenWidth(100),
//                   child: widget.count != null
//                       ? Visibility(
//                           visible: widget.count != 0,
//                           child: Container(
//                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                             child: CustomText(
//                               textType: TextStyleType.CUSTOM,
//                               text: '${widget.count}',
//                               color: AppColors.whiteColor,
//                               fontSize: screenWidth(30),
//                               fontWeight: FontWeight.bold,
//                             ),
//                             width: (screenWidth(20)),
//                             height: (screenWidth(20)),
//                             decoration: BoxDecoration(
//                               color: AppColors.notificationRedColor,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: AppColors.whiteColor,
//                                 width: 1.5,
//                               ),
//                             ),
//                           ),
//                         )
//                       : SizedBox(),
//                 )
//               ],
//             ),
//             verSpace(100),
//             CustomText(
//               textType: TextStyleType.CUSTOM,
//               text: widget.text ?? "",
//               color: widget.isSelected! ? AppColors.blackColor : AppColors.grey,
//               fontSize: screenHeight(60),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }








// import 'package:challenge_two/ui/shared/colors.dart';
// import 'package:challenge_two/ui/shared/custom_widgets/custom_text.dart';
// import 'package:challenge_two/ui/shared/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class NavItemWidget extends StatefulWidget {
//   const NavItemWidget({super.key, required this.count});
//   final int? count;
//   @override
//   State<NavItemWidget> createState() => _NavItemTestWidgetState();
// }

// class _NavItemTestWidgetState extends State<NavItemWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         InkWell(
//           onTap: () {
//             // Get.to(() => CartView());
//           },
//           child: SvgPicture.asset(
//             'assets/images/ic_shopping_cart.svg',
//             color: AppColors.mainOrangeColor,
//             width: screenWidth(10),
//             height: screenWidth(10),
//           ),
//         ),
//         PositionedDirectional(
//           top: screenWidth(100),
//           end: screenWidth(100),
//           child: Visibility(
//             visible: widget.count != 0,
//             child: Container(
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               child: CustomText(
//                 text: '${widget.count}',
//                 textColor: AppColors.mainWhiteColor,
//                 fontSize: screenWidth(30),
//                 fontWeight: FontWeight.bold,
//               ),
//               width: (screenWidth(20)),
//               height: (screenWidth(20)),
//               decoration: BoxDecoration(
//                 color: AppColors.mainRedColor,
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: AppColors.mainWhiteColor,
//                   width: 1.5,
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//     // return Stack(
//     //   children: [
//     //     InkWell(
//     //       onTap: () {
//     //         Get.to(() => CartView());
//     //       },
//     //       child: SvgPicture.asset(
//     //         'assets/images/ic_shopping_cart.svg',
//     //         color: AppColors.mainOrangeColor,
//     //         width: screenWidth(12),
//     //         height: screenWidth(12),
//     //       ),
//     //     ),
//     //   ],
//     // );
//   }
// }
