import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/ui/shared/colors.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({
    Key? key,
    required this.center,
  }) : super(key: key);

  final bool center;
  
  @override
  Widget build(BuildContext context) {
    return center
        ? Center(
            child: SpinKitWave(
              color: AppColors.blackColor,
              size: 30,
              type: SpinKitWaveType.center,
            ),
          )
        : SpinKitWave(
            color: AppColors.blackColor,
            size: 30,
            type: SpinKitWaveType.center,
          );
  }
}
