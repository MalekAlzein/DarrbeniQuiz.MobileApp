import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:new_quiz/UI/shared/colors.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_button.dart';
import 'package:new_quiz/UI/shared/custom_widgets/custom_textField.dart';
import 'package:new_quiz/UI/views/main_view/profile/Profile_view.dart';
import 'package:new_quiz/UI/views/main_view/profile/edit_profile_controller.dart';

import '../../../shared/utilis.dart';
import '../../login_view/login_controller.dart';
import '../../shared/colors.dart';
import '../../shared/utils.dart';
import '../main_view/profile_view/Profile_view.dart';

class editProfileView extends StatefulWidget {
  const editProfileView(
      {Key? key, required this.userName, required this.phoneumber})
      : super(key: key);
  final String userName;
  final int phoneumber;
  @override
  _editProfileViewState createState() => _editProfileViewState();
}

class _editProfileViewState extends State<editProfileView> {
  late editProfileController controller;
  void initState() {
    controller =
        Get.put(editProfileController(widget.userName, widget.phoneumber));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(17)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenWidth(8),
              ),
              child: Text(
                "اسم المستخدم",
                style: TextStyle(
                    color: AppColors.darkPurpleColor,
                    fontSize: screenWidth(24)),
              ),
            ),
            customTextField(
                hintTExt: "اسم المستخدم",
                prefixIcon: Icons.person_outlined,
                suffexIcon: Icons.edit_outlined,
                controller: controller.userNameController),
            SizedBox(
              height: screenWidth(35),
            ),
            Text(
              "رقم الهاتف",
              style: TextStyle(
                  color: AppColors.darkPurpleColor, fontSize: screenWidth(24)),
            ),
            customTextField(
                hintTExt: "رقم الهاتف",
                prefixIcon: Icons.phone_outlined,
                suffexIcon: Icons.edit_outlined,
                controller: controller.phoneController),
            SizedBox(
              height: screenWidth(3.7),
            ),
            customButton(
              text: "حفظ التغييرات",
            ),
            InkWell(
                onTap: () => Get.off(ProfileView()),
                child: Center(
                    child: Text(
                  "تراجع",
                  style: TextStyle(
                      fontSize: screenWidth(24),
                      color: AppColors.darkPurpleColor,
                      decoration: TextDecoration.underline),
                ))),
          ],
        ),
      ),
    ));
  }
}
