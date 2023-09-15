import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:get/get.dart';

import '../../../shared/utils.dart';
import 'notifications_controller.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          screenWidth(2.5).ph,

          controller.notificationsModel.value.data == null ? SpinKitCircle(color: AppColors.darkPurpleColor,) : Container(
            width: screenWidth(1.1),
            height: screenWidth(7.5),
            decoration: BoxDecoration(
              color: AppColors.normalCyanColorOpacity
            ),
            child: Row(
              children: [
                screenWidth(40).pw,
                SvgPicture.asset('assets/svgs/ic_nav_bar_notifications.svg' , color: AppColors.darkPurpleColor,),

                 Obx(() {
                  return controller.notificationsModel.value.data == null ? SpinKitCircle(color: AppColors.darkPurpleColor,) :
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.notificationsModel.value.data!.length,
                      itemBuilder: (context , index){
                        return CustomText(
                            textType: TextStyleType.BODY,
                            text: controller.notificationsModel.value.data![index].body ?? ''
                        );
                      }
                  );
                })


              ],
            ),
          ),
        ]
    );
  }
}
