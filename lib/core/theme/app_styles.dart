import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

abstract class AppStyles{
  static TextStyle appBarTitleStyle = GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.black,);
  static TextStyle labelStyle = GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.grey,);
  static TextStyle hintStyle = GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.placeHolder);
  static TextStyle regularText14Style = GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.black);
  static TextStyle mediumText16Style = GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.black);
}