import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shimmer.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_slider.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_page_controller.dart';
import 'package:get/get.dart';

class HomeTopSection extends StatefulWidget {
  const HomeTopSection({
    super.key,
  });

  @override
  State<HomeTopSection> createState() => _HomeTopSectionState();
}

class _HomeTopSectionState extends State<HomeTopSection> {
  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());

    return Column(
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
            print(controller.sliderList);
            return CustomShimmer(
              isLoading: controller.isLoading,
              child: CustomSlider(
                items: controller.sliderList.value,
              ),
            );
          },
        ),
      ],
    );
  }
}
