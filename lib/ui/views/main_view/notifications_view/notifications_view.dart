import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/views/main_view/notifications_view/notifications_controller.dart';
import 'package:get/get.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({
    super.key,
  });

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  late NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CustomText(
            textType: TextStyleType.TITLE,
            text: 'Notifications View',
          ),
        ),
      ),
    );
  }
}
