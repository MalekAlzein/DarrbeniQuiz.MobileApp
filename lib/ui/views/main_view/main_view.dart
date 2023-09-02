import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_page_view.dart';
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

  MainController controller = MainController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenWidth(3)),
        child: Obx(() {
          return CustomAppBar(
            firstText: controller.viewTitle[controller.pageIndex.value],
            svgName: controller.viewSVG[controller.pageIndex.value],
          );
        }
        ),
      ),

      bottomNavigationBar: Obx(() {
        return BottomNavigationWidget(
          bottomNavigation: controller.selected.value,
          onTap: (select, pageNumber) {
            controller.selected.value = select;
            controller.pageController.jumpToPage(pageNumber);
            controller.updateTitleAndSVG(pageNumber);
          },
        );
      }),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          NotificationsView(),
          HomePageView(),
          ImportantQuestionsView(),
          ProfileView(),
        ],
      ),
    );
  }
}