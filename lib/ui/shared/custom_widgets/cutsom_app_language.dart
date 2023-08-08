import 'package:flutter/material.dart';
import 'package:flutter_templete/app/my_app.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

class CustomAppLanguage extends StatefulWidget {
  const CustomAppLanguage({
    super.key,
    this.extraFunction,
  });

  final Function? extraFunction;

  @override
  State<CustomAppLanguage> createState() => _CustomAppLanguageState();
}

class _CustomAppLanguageState extends State<CustomAppLanguage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          title: 'Choose App Language',
          content: Column(
            children: [
              InkWell(
                onTap: () {
                  storage.setAppLanguage('en');
                  Get.updateLocale(getLocale());
                  Get.back();
                  if (widget.extraFunction != null) widget.extraFunction!();
                },
                child: CustomText(
                  textType: TextStyleType.BODY,
                  text: 'English',
                ),
              ),
              (screenWidth(20)).ph,
              InkWell(
                onTap: () {
                  storage.setAppLanguage('ar');
                  Get.updateLocale(getLocale());
                  Get.back();
                  if (widget.extraFunction != null) widget.extraFunction!();
                },
                child: CustomText(
                  textType: TextStyleType.BODY,
                  text: 'العربية',
                ),
              ),
              (screenWidth(20)).ph,
              InkWell(
                onTap: () {
                  storage.setAppLanguage('tr');
                  Get.updateLocale(getLocale());
                  Get.back();
                  if (widget.extraFunction != null) widget.extraFunction!();
                },
                child: CustomText(
                  textType: TextStyleType.BODY,
                  text: 'Türkçe',
                ),
              ),
            ],
          ),
        );
      },
      child: Icon(
        Icons.language,
        color: AppColors.mainOrangeColor,
      ),
    );
  }
}
