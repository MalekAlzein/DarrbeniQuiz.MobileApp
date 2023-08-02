import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

//alt+shift+o
class SplashSceenView extends StatefulWidget {
  const SplashSceenView({super.key});
  @override
  State<SplashSceenView> createState() => _SplashSceenViewState();
}

class _SplashSceenViewState extends State<SplashSceenView> {
  SplashSceenController controller = Get.put(SplashSceenController());
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
        SvgPicture.asset(
          'assets/images/bg_background.svg',
          height: screenHieght(1),
          width: screenWidth(1),
        ),
        Center(
            child: SvgPicture.asset(
          'assets/images/Logo.svg',
          width: screenWidth(5),
          height: screenHieght(5),
        )),
        Container(
          margin: EdgeInsets.only(bottom: screenWidth(3)),
          // width: size.width*0.1,
          height: screenWidth(3),
          child: SpinKitThreeBounce(
            color: AppColors.mainOrangeColor,
          ),
        ),
      ],
    )));
  }
}

// top:size.hiegh*0.7
