import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    required this.fillColor,
    required this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.maxHeight,
    this.maxWidth,
    this.hintTextSize,
    this.maxLines,
  });

  final String hintText;
  final TextEditingController? controller;
  final Color? fillColor;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? prefixIcon;
  final Color? prefixIconColor;
  final String? suffixIcon;
  final Color? suffixIconColor;
  final double? maxHeight;
  final double? maxWidth;
  final double? hintTextSize;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      // onChanged: myValidator,
      controller: controller,
      validator: validator,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      textAlign: TextAlign.start,
      cursorColor: AppColors.darkPurpleColor,
      decoration: InputDecoration(
        prefixIcon: UnconstrainedBox(
          child: SvgPicture.asset(
            'assets/svgs/$prefixIcon.svg',
            color: AppColors.darkPurpleColorOpacity,
            width: screenWidth(15),
          ),
        ),
        prefixIconColor: prefixIconColor,
        suffixIcon: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset(
            'assets/svgs/$suffixIcon.svg',
            color: AppColors.darkPurpleColorOpacity,
            width: screenWidth(15),
          ),
        ),
        suffixIconColor: suffixIconColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth(50),
        ),
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? screenWidth(1.1),
          maxHeight: maxHeight ?? screenHeight(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.transparentColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkPurpleColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        hintStyle: TextStyle(
          color: hintTextColor,
          fontSize: hintTextSize ?? screenWidth(24),
        ),
        hintText: hintText,
        fillColor: fillColor,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
    );
  }
}
