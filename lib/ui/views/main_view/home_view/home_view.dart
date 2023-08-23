import 'package:flutter/material.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_grid.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_main_category.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_slider.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_subtitle_container.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/loading_widget.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());
  List<String> category = [
    'الكل',
    'الكليات الهندسية',
    'الكليات الطبية',
  ];
  int _selectedChoiceIndex = 0;
  List<String> _choices = ['Option 1', 'Option 2', 'Option 3'];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(
              vertical: screenHeight(80), horizontal: screenWidth(15)),
          child: Column(
            children: [
              CustomTextFormField(
                  hintText: tr("key_search"),
                  hintTextSize: screenWidth(30),
                  fillColor: AppColors.darkGreyColorTextField,
                  hintTextColor: AppColors.darkGreyColorOpacity,
                  prefixIcon: 'ic_search',
                  prefixIconColor: AppColors.darkGreyColor),
              screenHeight(40).ph,
              Obx(
                () {
                  print(controller.silderList);
                  return controller.silderList.isEmpty
                      ? LoadingWidget(
                          center: true,
                        )
                      : CustomSlider(
                          homeController: controller,
                          silderList: controller.silderList,
                        );
                },
              ),
              CustomSubTitleContainer(
                text: tr('key_category'),
                color: AppColors.darkGreyColor,
              ),
              SizedBox(
                height: screenWidth(7),
                width: screenWidth(1),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  addAutomaticKeepAlives: true,
                  addRepaintBoundaries: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return MainCategory(
                      category: category[index],
                      onTap: () {
                        showUpsetDialog();
                      },
                    );
                  },
                ),
              ),
              // CustomGrideView(children: controller.items),
              // ChipTheme(
              //   data: ChipTheme.of(context).copyWith(
              //     backgroundColor:
              //         AppColors.whiteColor, // تعيين لون الخلفية العام للشرائح
              //     labelStyle: TextStyle(color: AppColors.darkPurpleColor),
              //     // تعيين نمط النص العام للشرائح
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(5),
              //       side: BorderSide(
              //         color: AppColors.darkPurpleColor, // تعيين لون الحدود
              //         width: 1, // تعيين عرض الحدود
              //       ), // تعيين شكل الحواف العام للشرائح
              //     ),
              //   ),
              //   child: Wrap(
              //     alignment: WrapAlignment.center,
              //     spacing: screenWidth(40),
              //     children: <Widget>[
              // Chip(label: Text('المترجمات')),
              // Chip(label: Text('داتا بيز')),
              // Chip(label: Text('اوتومات')),
              // Chip(label: Text('الشبكات')),
              // Chip(label: Text(' الذكاء الاصطناعي')),
              // Chip(label: Text('قواعد البيانات')),
              // Chip(label: Text('هندسة برمجيات')),
              // Chip(label: Text('امن')),
              // Chip(label: Text('خوارزميات')),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
