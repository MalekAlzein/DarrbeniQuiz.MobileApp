import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class LoginTopSectionWidget extends StatelessWidget {
  const LoginTopSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          textType: TextStyleType.SUBTITLE,
          fontWeight: FontWeight.bold,
          textColor: AppColors.darkGreyColor,
          text: tr('key_login'),
        ),
        (screenHeight(45)).ph,
        SvgPicture.asset(
          'assets/svgs/img_login.svg',
          // width: double.infinity,

          // fit: BoxFit.fill,
        ),
      ],
    );
  }
}
