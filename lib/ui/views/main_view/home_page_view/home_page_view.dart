import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_gridview.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shimmer.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_subtitle_container.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/course_details_view/subject_view.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_page_controller.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_view_widgets/custom_grid_college.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_view_widgets/home_top_section.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_view_widgets/home_view_category.dart';
import 'package:get/get.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future(() {
          controller.getAllColleges();
          controller.getAllSliders();
        });
      },
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(30),
            ),
            child: Column(
              children: [
                // CustomTextFormField(
                //   hintText: tr("key_search"),
                //   hintTextSize: screenWidth(30),
                //   fillColor: AppColors.darkGreyColorTextField,
                //   hintTextColor: AppColors.darkGreyColorOpacity,
                //   prefixIcon: 'ic_search',
                //   prefixIconColor: AppColors.darkGreyColorOpacity,
                //   onChanged: (value) {
                //     if (value.isEmpty) {
                //       controller.searchSpecializationspByQuery(query: value);
                //     }
                //   },
                //   onFieldSubmitted: (value) {
                //     controller.searchSpecializationspByQuery(query: value);
                //   },
                // ),
                // screenHeight(40).ph,
                // Obx(
                //   () {
                //     print(controller.sliderList);
                //     return CustomShimmer(
                //       isLoading: controller.isLoading,
                //       child: CustomSlider(
                //         items: controller.sliderList.value,
                //       ),
                //     );
                //   },
                // ),
                // screenWidth(8).ph,
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: screenWidth(35),
                  ),
                  child: Column(
                    children: [
                      HomeTopSection(
                        onChanged: (value) {
                          if (value.isEmpty) {
                            controller.searchSpecializationspByQuery(
                                query: value);
                          }
                        },
                        onFieldSubmitted: (value) {
                          controller.searchSpecializationspByQuery(
                              query: value);
                        },
                      ),
                      CustomSubTitleContainer(
                        text: tr('key_category'),
                        color: AppColors.darkGreyColor,
                      ),
                      Obx(
                        () {
                          // print(controller.silderList);
                          return storage.isLoggedIn
                              ? Visibility(
                                  visible: !controller.searchMode.value,
                                  child: SizedBox(
                                    height: screenHeight(8),
                                    width: screenWidth(1),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: controller.collegeList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Obx(
                                          () {
                                            int collageId = controller
                                                .collegeList[index].id!;
                                            bool isSelected = index ==
                                                controller
                                                    .selectedCollegeId.value;
                                            return CustomShimmer(
                                              isLoading: controller.isLoading,
                                              child: HomeViewCategoryWidget(
                                                text: controller
                                                    .collegeList[index]
                                                    .collageName,
                                                onTap: () {
                                                  controller
                                                      .getSpecializationspByCollege(
                                                          collegeId: collageId);
                                                  controller.selectedCollegeId
                                                      .value = index;
                                                },
                                                isSelected: isSelected,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : HomeViewCategoryWidget(
                                  text: controller.collegeList.isNotEmpty
                                      ? controller.collegeList[0].collageName
                                      : '',
                                  onTap: () {
                                    controller.getSpecializationspByCollege(
                                        collegeId:
                                            controller.collegeList[0].id!);
                                    controller.selectedCollegeId.value = 0;
                                  },
                                  isSelected: true,
                                );
                        },
                      ),
                      Obx(
                        () {
                          print(controller.selectedCollegeId.value);
                          return SizedBox(
                            width: screenWidth(1),
                            child: CustomGrideView(
                              children: List.generate(
                                controller.filteredSpecializationsList.length,
                                (index) => CustomShimmer(
                                  isLoading: controller.isLoading,
                                  child: CustomGridCollege(
                                    onTap: () {
                                      if (controller
                                          .filteredSpecializationsList[index]
                                          .moreOption!) {
                                        showSpecializationBottomSheet(
                                          specialization: controller
                                              .filteredSpecializationsList[
                                                  index]
                                              .moreOption!,
                                          specializationsModel: controller
                                                  .filteredSpecializationsList[
                                              index],
                                        );
                                      } else {
                                        // print("مافي ماستر ولا تخرج");
                                        controller.getSubjects(
                                            specialID: controller
                                                .subbedSpecialization);
                                        Get.to(() => SubjectView());
                                      }
                                    },
                                    isSubbed: storage.isLoggedIn
                                        ? controller.subbedCollege(index: index)
                                        : false,

                                    imageName:
                                        "http://via.placeholder.com/50x50",

                                    //  controller
                                    //         .filteredSpecializationsList[index]
                                    //         .image ??
                                    //     "",
                                    text: controller
                                            .filteredSpecializationsList[index]
                                            .specializationName ??
                                        "",
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // if (controller.searchMode.value) ...[
                      //   Obx(
                      //     () {
                      //       print(controller.selectedCollegeId.value);
                      //       return SizedBox(
                      //         width: screenWidth(1),
                      //         child: CustomGrideView(
                      //           children: List.generate(
                      //             controller.filteredSpecializationsList.length,
                      //             (index) => CustomShimmer(
                      //               isLoading: controller.isLoading,
                      //               child: CustomGridCollege(
                      //                 onTap: () {
                      //                   if (controller
                      //                       .filteredSpecializationsList[index]
                      //                       .moreOption!) {
                      //                     showSpecializationBottomSheet(
                      //                       specialization: controller
                      //                           .filteredSpecializationsList[
                      //                               index]
                      //                           .moreOption!,
                      //                       specializationsModel: controller
                      //                               .filteredSpecializationsList[
                      //                           index],
                      //                     );
                      //                   } else {
                      //                     // print("مافي ماستر ولا تخرج");
                      //                     controller.getSubjects(
                      //                         specialID: controller
                      //                             .subbedSpecialization);
                      //                     Get.to(() => SubjectView());
                      //                   }
                      //                 },
                      //                 isSubbed: storage.isLoggedIn
                      //                     ? controller.subbedCollege(
                      //                         index: index)
                      //                     : false,

                      //                 imageName:
                      //                     "http://via.placeholder.com/50x50",

                      //                 //  controller
                      //                 //         .filteredSpecializationsList[index]
                      //                 //         .image ??
                      //                 //     "",
                      //                 text: controller
                      //                         .filteredSpecializationsList[
                      //                             index]
                      //                         .specializationName ??
                      //                     "",
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ]
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
