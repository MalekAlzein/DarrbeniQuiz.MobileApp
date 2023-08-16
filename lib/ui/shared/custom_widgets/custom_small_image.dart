import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {super.key, required this.imageName, this.colorImage, this.imageSize});
  final String imageName;
  final Color? colorImage;
  final double? imageSize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/svgs/$imageName.svg',
        color: colorImage,
        width: imageSize ?? screenWidth(18),
      ),
    );
  }
}
