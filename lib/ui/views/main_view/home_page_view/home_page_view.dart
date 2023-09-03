import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_gridview.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shimmer.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_slider.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_subtitle_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_page_controller.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_view_widgets/custom_grid_college.dart';
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
    return ListView(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(
              // vertical: screenHeight(7.5),
              // horizontal: screenWidth(35),
              ),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: tr("key_search"),
                hintTextSize: screenWidth(30),
                fillColor: AppColors.darkGreyColorTextField,
                hintTextColor: AppColors.darkGreyColorOpacity,
                prefixIcon: 'ic_search',
                prefixIconColor: AppColors.darkGreyColorOpacity,
              ),
              screenHeight(40).ph,
              Obx(
                () {
                  print(controller.silderList);
                  return CustomShimmer(
                    center: true,
                    isLoading: controller.isLoading,
                    child: CustomSlider(
                      items: controller.silderList.value,
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: screenWidth(35),
                ),
                child: Column(
                  children: [
                    CustomSubTitleContainer(
                      text: tr('key_category'),
                      color: AppColors.darkGreyColor,
                    ),
                    Obx(() {
                      // print(controller.silderList);
                      return SizedBox(
                        height: screenHeight(8),
                        width: screenWidth(1),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.collegeList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(
                              () {
                                int collageId =
                                    controller.collegeList[index].id!;
                                bool isSelected =
                                    index == controller.selectedCollegeId.value;
                                return CustomShimmer(
                                  isLoading: controller.isLoading,
                                  center: true,
                                  child: HomeViewCategoryWidget(
                                    text: controller
                                        .collegeList[index].collageName,
                                    onTap: () {
                                      controller.getSpecializationspByCollege(
                                          collageId);
                                      controller.selectedCollegeId.value =
                                          index;
                                    },
                                    isSelected: isSelected,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    }),
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
                                center: true,
                                child: Flexible(
                                  child: CustomGridCollege(
                                    onTap: () {
                                      if (controller
                                          .filteredSpecializationsList[index]
                                          .moreOption!) {
                                        // TODO: remove comment inside bottomSheet for SubjectView Navigation
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
                                        print("مافي ماستر ولا تخرج");
                                        // TODO: put SubjectView Navigation
                                        // Get.to(()=> VIEW );
                                      }
                                    },
                                    isSubbed:
                                        controller.subbedCollege(index: index),
                                    // imageName: "img_login",
                                    imageName: controller
                                            .filteredSpecializationsList[index]
                                            .image ??
                                        "",
                                    text: controller
                                            .filteredSpecializationsList[index]
                                            .specializationName ??
                                        "",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
