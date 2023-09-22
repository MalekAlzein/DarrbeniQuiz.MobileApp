import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_chip_list.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shimmer.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class SubjectsShimmer extends StatefulWidget {
  const SubjectsShimmer({super.key});

  @override
  State<SubjectsShimmer> createState() => _SubjectsShimmerState();
}

class _SubjectsShimmerState extends State<SubjectsShimmer> {
  List<String> shimmer = ["1", "2", "3", "4"];
  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Center(
        child: CustomChipList(
          direction: Axis.vertical,
          children: List.generate(
            3,
            (index) => Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                // shape:BoxShape.rectangle BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth(100)),
                border: Border.all(
                  color: AppColors.darkPurpleColor,
                ),
              ),
              width: screenWidth(3),
              height: screenHeight(20),
            ),
          ),
        ),
      ),
      isLoading: true,
    );
  }
}
