import 'package:flutter/material.dart';
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
  });

  final String hintText;
  final TextEditingController? controller;
  final Color? fillColor;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final double? maxHeight;
  final double? maxWidth;
  final double? hintTextSize;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onChanged: myValidator,
      controller: controller,
      validator: validator,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        contentPadding: EdgeInsets.symmetric(horizontal: screenWidth(18)),
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
        filled: true,
        hintStyle: TextStyle(
          color: hintTextColor,
          fontSize: hintTextSize,
        ),
        hintText: hintText,
        fillColor: fillColor,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
    );
  }
}
