import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';

typedef ValidatorFunction = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  TextEditingController? controller;
  ValidatorFunction validator;
  String? hintText;
  TextInputType textInputType;
  String labelText;
  bool isPassword;
  bool readOnly;

  CustomTextFormField({
    super.key,
    this.validator,
    this.hintText,
    required this.labelText,
    this.controller,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: AppStyles.labelStyle,
        hintStyle:AppStyles.hintStyle,
        fillColor: AppColors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.grey, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.red, width: 1),
        ),
      ),
      style: AppStyles.regularText14Style,
      validator: validator,
      controller: controller,
      cursorColor: AppColors.black,
      autocorrect: true,
      keyboardType: textInputType,
      obscureText: isPassword ? true : false,
      readOnly: readOnly,
      maxLines: 1,
    );
  }
}
