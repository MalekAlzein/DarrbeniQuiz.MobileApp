// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// class CustomDrawer extends StatelessWidget {
//   CustomDrawer({
//     super.key,
//     required this.controller,
//     required this.drawerWidth,
//     this.drawerheight,
//     this.drawerBackgroundColor,
//     this.onOpen,
//   });
//   final double? drawerWidth;
//   final double? drawerheight;
//   final Color? drawerBackgroundColor;
//   final MainController controller;
//   final Function? onOpen;

//   @override
//   Widget build(BuildContext context) {
//     return CustomBlurWidget(
//       customBlurChildType: CustomBlurChildType.DRAWER,
//       child: GestureDetector(
//         onTap: () {
//           if (onOpen != null) onOpen!();
//         },
//         child: Container(
//           height: drawerheight,
//           width: drawerWidth,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadiusDirectional.only(
//               topEnd: Radius.circular(25),
//               bottomEnd: Radius.circular(25),
//             ),
//             color: drawerBackgroundColor ?? AppColors.whiteColor,
//           ),
//           child: Padding(
//             padding: EdgeInsetsDirectional.symmetric(
//               vertical: screenHeightPercent(50),
//             ),
//             child: Column(
//               children: [
//                 Obx(
//                   () {
//                     return Container(
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       child: controller.userProfileModel.value.avatar != null &&
//                               controller
//                                   .userProfileModel.value.avatar!.isNotEmpty
//                           ? CachedNetworkImage(
//                               imageUrl:
//                                   controller.userProfileModel.value.avatar ??
//                                       "",
//                               fit: BoxFit.cover,
//                             )
//                           : Icon(
//                               Icons.image,
//                               color: AppColors.fillColorButtonIcon,
//                             ),
//                       width: (screenWidthPercent(3.5)),
//                       height: (screenWidthPercent(3.5)),
//                       decoration: BoxDecoration(
//                         color: AppColors.whiteColor,
//                         shape: BoxShape.circle,
//                       ),
//                     );
//                   },
//                 ),
//                 verSpace(30),
//                 Obx(
//                   () {
//                     return CustomText(
//                       textType: TextStyleType.BODY,
//                       text:
//                           "${controller.userProfileModel.value.displayName ?? controller.userProfileModel.value.username ?? "nothing found"}",
//                       color: AppColors.primaryFontColor,
//                       fontWeight: FontWeight.bold,
//                       // fontSize: screenHeightPercent(42),
//                     );
//                   },
//                 ),
//                 verSpace(30),
//                 CustomListTile(
//                   prefixImageName: "ic_add-square",
//                   text: tr("add_app_link"),
//                   onTap: () async {
//                     Get.back();
//                     await Get.to(() => AddAppLinkView());
//                   },
//                 ),
//                 Divider(
//                   color: AppColors.drawerDividerColor,
//                 ),
//                 CustomListTile(
//                   prefixImageName: "ic_language",
//                   text: tr("general_change_language"),
//                   onTap: () {
//                     Get.back();
//                     showLanguageBottomSheet(sendApiLanguageChange: true);
//                   },
//                 ),
//                 Divider(
//                   color: AppColors.drawerDividerColor,
//                 ),
//                 Spacer(),
//                 Divider(
//                   height: 1,
//                   color: AppColors.drawerDividerColor,
//                 ),
//                 Divider(
//                   color: AppColors.drawerDividerColor,
//                 ),
//                 CustomListTile(
//                   prefixImageName: "ic_setting",
//                   text: tr("general_settings"),
//                   onTap: () {
//                     Get.back();
//                     controller.pageNavigation(BottomNavigationEnum.SETTING, 2);
//                   },
//                 ),
//                 Divider(
//                   color: AppColors.drawerDividerColor,
//                 ),
//                 CustomListTile(
//                   prefixImageName: "ic_logout",
//                   text: tr("general_logout"),
//                   onTap: () {
//                     controller.logout();
//                     // storage.clearTokenInfo();
//                     // Get.delete<SplashController>();
//                     // Get.offAll(() => SplashView());
//                   },
//                 ),
//                 Divider(
//                   color: AppColors.drawerDividerColor,
//                 ),
//                 CustomText(
//                   textType: TextStyleType.BODY,
//                   text:
//                       "${tr("general_version")}: ${packageInfoService.version}",
//                   color: AppColors.fillColorButtonIcon,
//                   // fontSize: screenHeightPercent(45),
//                   fontWeight: FontWeight.w500,
//                   textAlign: TextAlign.start,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
