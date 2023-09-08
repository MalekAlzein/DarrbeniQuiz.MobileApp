import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/utils.dart';

class YearsQuestionsShimmer extends StatefulWidget {
  const YearsQuestionsShimmer({super.key});

  @override
  State<YearsQuestionsShimmer> createState() => _YearsQuestionsShimmerState();
}

class _YearsQuestionsShimmerState extends State<YearsQuestionsShimmer> {
  List<String> shimmer = ["1", "2", "3", "4"];
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(25)),
          child: Column(
            children: shimmer.map((e) {
              return Padding(
                padding:
                    EdgeInsetsDirectional.symmetric(vertical: screenWidth(30)),
                child: Container(
                  height: screenHeight(20),
                  decoration: BoxDecoration(
                    color: AppColors.fillGreyColor,
                    borderRadius: BorderRadius.circular(screenWidth(50)),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!);
  }
}
