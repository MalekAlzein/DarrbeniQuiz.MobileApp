// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
// import 'package:get/get.dart';

// import '../home_page_controller.dart';

// class HomeTopSection extends StatefulWidget {
//   const HomeTopSection({super.key});

//   @override
//   State<HomeTopSection> createState() => _HomeTopSectionState();
// }

// class _HomeTopSectionState extends State<HomeTopSection> {
//   int _current = 0;
//   final CarouselController _controller = CarouselController();
//   List<String> imgList = [
//     'assets/images/intro1.svg',
//     'assets/images/intro1.svg',
//     'assets/images/intro1.svg',
//   ];
//   HomePageController controller = Get.put(HomePageController());

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // UserInput(
//         //   controller: controller.searchController,
//         //   fillColor: AppColors.searchfieldColor,
//         //   text: "يحث",
//         //   prefixIcon: Transform.scale(
//         //       scale: 0.4,
//         //       child: SvgPicture.asset('assets/images/ic_search.svg')),
//         // ),
//         // 30.ph,
//         30.ph,
//         Row(
//           children: [
//             InkWell(
//               onTap: () {
//                 controller.currentMajorIndex.value = -1;
//               },
//               child: InkWell(
//                 onTap: controller.showSubjects.value
//                     ? () {
//                         controller.showSubjects.value = false;
//                       }
//                     : null,
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       border: BorderDirectional(
//                     start: BorderSide(color: AppColors.mainGreyColor),
//                   )),
//                   child: CustomText(
//                     text: 'التصنيفات',
//                     textColor: AppColors.mainGreyColor,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   AnimatedSmoothIndicator indicatorBuilder() {
//     return AnimatedSmoothIndicator(
//         effect: WormEffect(
//             paintStyle: PaintingStyle.stroke,
//             radius: 0,
//             spacing: 15,
//             dotWidth: 7,
//             dotHeight: 7,
//             strokeWidth: 1,
//             dotColor: AppColors.mainPurpleColore,
//             activeDotColor: AppColors.mainPurpleColore),
//         activeIndex: _current,
//         count: imgList.length);
//   }
// }
