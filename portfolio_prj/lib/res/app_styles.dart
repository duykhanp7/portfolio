import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

class AppStyles {
  static const String fontPoppins = 'Poppins';
  static const String fontDMSans = 'DMSans';
  static const textBaseline = TextBaseline.alphabetic;
  static const leadingDistribution = TextLeadingDistribution.even;
  static const fontColor = AppColors.black;

  static TextStyle menu = const TextStyle(
      fontFamily: fontDMSans,
      color: AppColors.brown,
      fontWeight: FontWeight.w500,
      textBaseline: textBaseline,
      fontSize: 20,
      leadingDistribution: leadingDistribution);

  static TextStyle header = const TextStyle(
      fontFamily: fontPoppins,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      textBaseline: textBaseline,
      fontSize: 48,
      leadingDistribution: leadingDistribution);

  static TextStyle title = const TextStyle(
      fontFamily: fontPoppins,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      textBaseline: textBaseline,
      fontSize: 28,
      leadingDistribution: leadingDistribution);

  static TextStyle content = const TextStyle(
      fontFamily: fontPoppins,
      color: AppColors.black,
      fontWeight: FontWeight.w300,
      textBaseline: textBaseline,
      fontSize: 18,
      leadingDistribution: leadingDistribution);
}
