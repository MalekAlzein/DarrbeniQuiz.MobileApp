import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';


class CustomNotificationWidget extends StatefulWidget {
  const CustomNotificationWidget({
    super.key,
    required this.count,
    required this.imageName,
    required this.onTap,
  });

  final int? count;
  final String? imageName;
  final Function? onTap;

  @override
  State<CustomNotificationWidget> createState() =>
      _CustomNotificationWidgetState();
}

class _CustomNotificationWidgetState extends State<CustomNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {
            if (widget.onTap != null) widget.onTap!();
          },
          child: SvgPicture.asset(
            'assets/images/${widget.imageName}.svg',
            color: AppColors.mainOrangeColor,
            width: screenWidth(10),
            height: screenWidth(10),
          ),
        ),
        PositionedDirectional(
          top: -screenWidth(100),
          end: -screenWidth(100),
          child: Visibility(
            visible: widget.count != 0,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CustomText(
                text: '${widget.count}',
                textColor: AppColors.mainWhiteColor,
                fontSize: screenWidth(30),
                fontWeight: FontWeight.bold,
              ),
              width: (screenWidth(20)),
              height: (screenWidth(20)),
              decoration: BoxDecoration(
                color: AppColors.mainRedColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.mainWhiteColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        )
      ],
    );
    // return Stack(
    //   children: [
    //     InkWell(
    //       onTap: () {
    //         Get.to(() => CartView());
    //       },
    //       child: SvgPicture.asset(
    //         'assets/images/ic_shopping_cart.svg',
    //         color: AppColors.mainOrangeColor,
    //         width: screenWidth(12),
    //         height: screenWidth(12),
    //       ),
    //     ),
    //   ],
    // );
  }
}
