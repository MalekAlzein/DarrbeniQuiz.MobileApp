import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

//alt+shift+o
class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});
  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SplashScreenController controller = Get.put(SplashScreenController());
  //lazyput
  //putasync

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.passthrough,
      children: [
        // SvgPicture.asset(
        //   'assets/images/bg_background.svg',
        //   height: screenHeight(1),
        //   width: screenWidth(1),
        // ),
        // Center(
        //     child: SvgPicture.asset(
        //   'assets/images/Logo.svg',
        //   width: screenWidth(5),
        //   height: screenHeight(5),
        // )),
        screenWidth(10).ph,
        Container(
          margin: EdgeInsets.only(bottom: screenWidth(3)),
          // width: size.width*0.1,
          height: screenWidth(3),
          child: SpinKitThreeBounce(
            color: AppColors.darkPurpleColor,
          ),
        ),
      ],
    )));
  }
}

// top:size.hiegh*0.7
