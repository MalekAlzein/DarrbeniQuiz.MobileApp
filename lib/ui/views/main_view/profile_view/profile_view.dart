import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/custom_widgets/custom_row.dart';
import '../../../shared/custom_widgets/custom_shimmer.dart';
import '../../../shared/custom_widgets/custom_text.dart';
import '../../../shared/utils.dart';
import '../../edit_profile_view/edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

ProfileController controller = Get.put(ProfileController());

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(17)),
        child: Padding(
          padding: EdgeInsets.only(top: screenWidth(3)),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/svgs/user_pic.svg",
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(30), bottom: screenWidth(8)),
                child: Obx(() {
                  return CustomText(
                    textType: TextStyleType.SMALL,
                    text: controller.name.value,
                  );
                }),
              ),
              CustomRow(
                svgname: 'ic_edit',
                text: "المعلومات الشخصية",
                color: AppColors.darkPurpleColor,
                onTap: () => Get.to(editProfileView(
                  name: controller.name.value,
                  phoneNumber: controller.phone.value,
                )),
              ),
              SizedBox(
                height: screenWidth(24),
              ),
              CustomRow(
                svgname: 'ic_send_feedback',
                text: "ارسال شكاوي",
                color: AppColors.normalCyanColor,
                onTap: () {},
              ),
              SizedBox(
                height: screenWidth(24),
              ),
              CustomRow(
                  svgname: 'ic_about_us',
                  text: "عن التطبيق",
                  color: AppColors.blackColor,
                  onTap: () {}),
              SizedBox(
                height: screenWidth(8),
              ),
              CustomButton(
                  buttonTypeEnum: ButtonTypeEnum.CUSTOM,
                  text: "تسجيل الخروج",
                  onPressed: () => controller.logout())
            ],
          ),
        ),
      ),
    );
  }
}
