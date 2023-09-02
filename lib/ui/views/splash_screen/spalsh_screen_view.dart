import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/svgs/darrebnibackground.png',
              fit: BoxFit.fill,
              width: screenWidth(1),
            ),
            Center(
                child: Image.asset(
              width: screenWidth(4),
              'assets/svgs/logo+text.png',
            )),
            Container(
              margin: EdgeInsets.only(top: screenHeight(4)),
              height: screenWidth(90),
              child: SpinKitThreeInOut(
                size: screenHeight(30),
                color: AppColors.darkPurpleColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight(40)),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Image.asset(
                  'assets/svgs/Logo & Profile.png',
                  width: screenWidth(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
