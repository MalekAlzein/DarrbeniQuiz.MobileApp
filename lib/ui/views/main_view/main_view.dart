import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_view.dart';
import 'package:flutter_templete/ui/views/main_view/important_questions_view/important_questions_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_controller.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widgets/bottom_navigation_widget.dart';
import 'package:flutter_templete/ui/views/main_view/notifications_view/notifications_view.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_view.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset: false,
      key: controller.scaffoldKey,
      // drawer: CustomDrawer(
      //   drawerWidth: screenWidth(1.5),
      //   drawerheight: screenHeight(2),
      //   controller: controller,
      //   onOpen: () {},
      // ),
      body: Obx(
        () {
          return Stack(
            children: [
              PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: [
                  ProfileView(),
                  ImportantQuestionsView(),
                  HomeView(),
                  NotificationsView(),
                ],
              ),
              PositionedDirectional(
                bottom: 0,
                child: BottomNavigationWidget(
                  bottomNavigationEnum: controller.selectedPage.value,
                  onTap: (selectedEnum, pageNumber) {
                    controller.pageNavigation(selectedEnum, pageNumber);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
