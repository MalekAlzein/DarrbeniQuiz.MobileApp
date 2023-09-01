import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_gridview.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_slider.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_page_controller.dart';
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
            vertical: screenHeight(7.5),
            horizontal: screenWidth(15),
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
                  return controller.silderList.isEmpty
                      ? LoadingWidget(
                          center: true,
                        )
                      : CustomSlider(
                          items: [],
                        );
                },
              ),
              CustomSubTitleContainer(
                text: tr('key_category'),
                color: AppColors.darkGreyColor,
              ),
              Obx(() {
                print(controller.silderList);
                return SizedBox(
                  height: screenHeight(8),
                  width: screenWidth(1),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.categoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      String categoryUUID =
                          controller.categoryList[index].uuid!;
                      bool isSelected =
                          categoryUUID == controller.selectedCategory.value;

                      return HomeViewCategoryWidget(
                        text: controller.categoryList[index].name,
                        onTap: () {
                          controller.getCollegesByCategory(categoryUUID);
                        },
                        isSelected: isSelected,
                      );
                    },
                  ),
                );
              }),
              Obx(
                () {
                  return SizedBox(
                      width: screenWidth(1),
                      child: CustomGrideView(
                          children: List.generate(
                        controller.filteredCollegeList.length,
                        (index) => Flexible(
                          child: CustomGridCollege(
                            onTap: () {
                              showSpecializationBottomSheet(
                                specialization: controller
                                    .filteredCollegeList[index].isMaster!,
                                collegeModel:
                                    controller.filteredCollegeList[index],
                              );
                            },
                            isSubbed: controller.subbedCollege(index: index),
                            // imageName: "img_login",
                            imageName:
                                controller.filteredCollegeList[index].logo ??
                                    "",
                            text: controller.filteredCollegeList[index].name ??
                                "",
                          ),
                        ),
                      ))
                      //

                      );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
