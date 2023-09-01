import 'package:flutter/material.dart';

class CustomChipList extends StatelessWidget {
  const CustomChipList(
      {super.key, this.direction = Axis.horizontal, required this.children});
  final Axis? direction;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: direction!,
      // AppConfig.currentEducation == EducationType.MASTER
      //     ? Axis.vertical
      //     : Axis.horizontal,
      children: children,
      // List.generate(
      //   homeViewController.collegeSubjects.length,
      //   (index) => InkWell(
      //     onTap: () {
      //       // mainViewController.pageTitle.value =
      //       //     signUpViewController.selectedMajor.value +
      //       //         ' / ' +
      //       //         homeViewController
      //       //             .collegeSubjects[index].name!;

      //       // context.push(BookCourseButtons(
      //       //   subjectID: homeViewController
      //       //       .collegeSubjects[index].uuid!,
      //       //   specialID: widget.specialId,
      //       // ));
      //     },
      //     child: Container(
      //       margin: EdgeInsets.only(left: 6),
      //       padding: EdgeInsets.all(6),
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(5),
      //           border: Border.all(color: AppColors.darkPurpleColor, width: 1)),
      //       child: CustomText(
      //         fontSize: 14,
      //         text: homeViewController.collegeSubjects[index],
      //         textType: TextStyleType.SMALL,
      //       ),
      //     ),
      //   ),
      // ),
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 20,
      spacing: 10,
      alignment: WrapAlignment.center,
    );
  }
}
