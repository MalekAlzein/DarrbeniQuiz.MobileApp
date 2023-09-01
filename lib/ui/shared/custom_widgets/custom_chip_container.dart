import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

import '../colors.dart';

class CustomChipContainer extends StatelessWidget {
  const CustomChipContainer({
    super.key,
    required this.text,
    this.borderColor,
    this.width,
    required this.onTap,
  });
  final String text;
  final Color? borderColor;
  final double? width;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap;
        // mainViewController.pageTitle.value =
        //     signUpViewController.selectedMajor.value +
        //         ' / ' +
        //         homeViewController
        //             .collegeSubjects[index].name!;
        // context.push(BookCourseButtons(
        //   subjectID: homeViewController
        //       .collegeSubjects[index].uuid!,
        //   specialID: widget.specialId,
        // ));
      },
      child: Container(
        margin: EdgeInsets.only(left: screenWidth(600)),
        padding: EdgeInsets.all(screenWidth(600)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth(50)),
            border: Border.all(
              color: borderColor ?? AppColors.darkPurpleColor,
              width: width ?? 1,
            )),
        child: CustomText(
          text: text,
          textType: TextStyleType.SMALL,
        ),
      ),
    );
  }
}
