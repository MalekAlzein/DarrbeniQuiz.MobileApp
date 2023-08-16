import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomImages extends StatelessWidget {
  const CustomImages(
      {super.key, required this.imageName, this.imageSize, this.imageColor});
  final String imageName;
  final double? imageSize;
  final Color? imageColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/svgs/$imageName.svg',
        width: imageSize ?? screenWidth(1.9),
        height: imageSize,
        color: imageColor,
      ),
    );
  }
}
