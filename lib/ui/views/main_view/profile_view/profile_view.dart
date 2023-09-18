import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/about_us/about_us_view.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_controller.dart';
import 'package:get/get.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/custom_widgets/custom_row.dart';
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
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenWidth(2.8)),
                child: Container(
                  padding: EdgeInsetsDirectional.all(screenWidth(100)),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.normalCyanColor , width: screenWidth(200)),
                    borderRadius: BorderRadius.circular(100)
                  ),
                    child: Icon(Icons.person , color: AppColors.normalCyanColor,size: screenWidth(3.5),))
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(30), bottom: screenWidth(8)),
                child: Obx(() {
                  return CustomText(
                    textType: TextStyleType.BODY,
                    text: controller.name.value,
                  );
                }),
              ),
              CustomRow(
                svgname: 'ic_edit',
                text: "المعلومات الشخصية",
                color: AppColors.darkPurpleColor,
                onTap: () => Get.to(
                    editProfileView(
                  name: controller.name.value,
                  phoneNumber: controller.phone.value,
                )),
              ),
              (screenWidth(24)).ph,
              CustomRow(
                svgname: 'ic_send_feedback',
                text: "ارسال شكاوي",
                color: AppColors.normalCyanColor,
                onTap: () {},
              ),
              (screenWidth(24)).ph,
              CustomRow(
                  svgname: 'ic_about_us',
                  text: "عن التطبيق",
                  color: AppColors.blackColor,
                  onTap: () {Get.to(AboutAppView());}),
              (screenWidth(5)).ph,
              Obx(() {
                return controller.loader.value
                    ? SpinKitThreeBounce(
                        color: AppColors.darkPurpleColor,
                      )
                    : CustomButton(
                        buttonTypeEnum: ButtonTypeEnum.CUSTOM,
                        onPressed: () {
                          controller.logout();
                        },
                        backgroundColor: AppColors.darkPurpleColor,
                        text: "تسجيل خروج",
                      );
              }),
            ],
          ),
        ),
    );
  }
}
