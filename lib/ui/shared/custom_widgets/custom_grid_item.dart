import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomGridCollege extends StatelessWidget {
  const CustomGridCollege({
    super.key,
    required this.imageName,
    required this.text,
    this.onTap,
    this.isSubbed = true,
  });

  final String imageName;
  final String text;
  final Function? onTap;
  final bool isSubbed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSubbed
          ? () {
              if (onTap != null) onTap!();
            }
          : null,
      child: Column(
        children: [
          CustomImages(
            imageName: imageName,
            imageSize: screenWidth(6),
          ),
          CustomText(
            textType: TextStyleType.SMALL,
            text: text,
          ),
        ],
      ),
    );
  }
}
