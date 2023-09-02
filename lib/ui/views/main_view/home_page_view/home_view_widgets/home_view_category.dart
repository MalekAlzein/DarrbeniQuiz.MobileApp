import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';

class HomeViewCategoryWidget extends StatefulWidget {
  const HomeViewCategoryWidget({
    super.key,
    this.text,
    required this.isSelected,
    required this.onTap,
  });
  final String? text;
  final Function onTap;
  final bool isSelected;

  @override
  State<HomeViewCategoryWidget> createState() => _HomeViewCategoryWidgetState();
}

class _HomeViewCategoryWidgetState extends State<HomeViewCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          alignment: AlignmentDirectional.center,
          // width: screenWidth(2),
          height: 50,
          decoration: BoxDecoration(
            border: widget.isSelected
                ? Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColors.normalCyanColor,
                    ),
                  )
                : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomText(
            textType: TextStyleType.SUBTITLE,
            text: widget.text ?? 'nothing found',
            textColor: widget.isSelected
                ? AppColors.normalCyanColor
                : AppColors.darkGreyColor,
          ),
        ),
      ),
    );
  }
}
