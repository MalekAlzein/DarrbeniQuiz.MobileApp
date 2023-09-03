import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/views/course_details_view/course_details_view.dart';
import 'package:get/get.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(CourseDetailsView()),
      child: Center(
        child: Text('home'),
      ),
    );
  }
}
