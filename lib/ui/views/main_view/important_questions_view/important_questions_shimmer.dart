import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_shimmer.dart';

import '../../../shared/utils.dart';

class ImportantQuestionsShimmer extends StatefulWidget {
  const ImportantQuestionsShimmer({super.key});

  @override
  State<ImportantQuestionsShimmer> createState() =>
      _ImportantQuestionsShimmerState();
}

class _ImportantQuestionsShimmerState extends State<ImportantQuestionsShimmer> {
  List<String> shimmer = ["1", "2", "3", "4"];
  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            vertical: screenHeight(5), horizontal: screenWidth(25)),
        child: Column(
          children: shimmer.map((e) {
            return Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: screenWidth(30)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: screenWidth(1),
                height: 50,
                color: AppColors.darkGreyColorOpacity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth(1.3),
                      height: 20,
                      color: AppColors.darkGreyColorOpacity,
                    ),
                    SvgPicture.asset("assets/svgs/ic_arrow.svg"),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
      isLoading: true,
    );
  }
}
