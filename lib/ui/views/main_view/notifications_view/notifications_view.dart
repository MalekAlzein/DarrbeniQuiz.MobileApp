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
    return SafeArea(
      child:
      Scaffold(
        body:Column(

          children: [
            screenWidth(2.5).ph,
            Obx((){
              return controller.notificationsModel.value.isEmpty
                  ? SpinKitCircle(
                color: Colors.red,
              )
                :
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.notificationsModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:  EdgeInsets.only(left: screenWidth(20),right: screenWidth(20),top: screenWidth(20)),
                    child: Container(
                      width: double.infinity,
                      color: AppColors.lightCyanColorOpacity,
                      child: Row(
                        children: [
                          screenWidth(40).pw,
                          Image.asset('assets/svgs/not.png',
                          width: screenWidth(7),
                          height:screenWidth(7),
                          color: AppColors.blackColor.withOpacity(0.6),),
                          screenWidth(30).pw,
                          Column(
                            children: [
                              CustomText(
                                text: controller.notificationsModel[index].title??'', textType: TextStyleType.BODY ,
                              ),
                              screenWidth(60).pw,

                              CustomText(
                                text: controller.notificationsModel[index].body??'', textType: TextStyleType.BODY ,
                              ),
                            ],
                          )

                        ],

                      ),
                    ),
                  );
                },
              );
            }),

          ],
        ),
      ),
    );
  }
}
