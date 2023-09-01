import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:new_quiz/UI/views/main_view/profile/profile_controller.dart';

import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/custom_widgets/custom_row.dart';
import '../../../shared/custom_widgets/custom_shimmer.dart';
import '../../../shared/custom_widgets/custom_text.dart';
import '../../../shared/utilis.dart';

import 'aboutus/aboutus.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}
profileController controller=Get.put(profileController());

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(17)),
        child: Padding(
          padding:  EdgeInsets.only(top:screenWidth(5)),
          child: Column(
            children: [
              SvgPicture.asset('images/User-100.svg',),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(30), bottom: screenWidth(8)),
                child: Obx(() {
                  return CustomShimmer(child: CustomText(
                    textType: TextStyleType.BODY, text: controller.name.value,),
                    isLoading:controller.name.value=="",);
                }
                ),
              ),
              CustomRow(
                svgname: 'edit',
                text: "المعلومات الشخصية",
                color: AppColors.darkPurpleColor,
                onTap: () =>
                    Get.to(editProfileView(userName: controller.name.value, phoneumber: controller.phone.value)),),
              SizedBox(
                height: screenWidth(24),
              ),
              CustomRow(
                svgname: 'ic_send',
                text: "إرسال شكوى",
                color: AppColors.mainbluecolor,
                onTap: () {},),
              SizedBox(
                height: screenWidth(24),
              ),
              CustomRow(
                  svgname: 'ic_info',
                  text: "عن التطبيق",
                  color: AppColors.blackColor,
                  onTap: () => Get.to(AboutUs())
              ),


              SizedBox(
                height: screenWidth(8),
              ),
              customButton(
                text: "تسجيل الخروج", onPressed: () => controller.logout(),)


            ],
          ),
        ),
      ),
    );
  }
}