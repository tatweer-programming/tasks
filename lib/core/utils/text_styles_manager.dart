import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tasks/core/utils/color_manager.dart';

class TextStylesManager {
  static TextStyle authTitle = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeight.w700,
    fontSize: 16.spa,
  );
  static TextStyle whiteTitle = TextStyle(
    color: ColorManager.white,
    fontWeight: FontWeight.w700,
    fontSize: 16.spa,
  );
  static TextStyle cardTitle = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeight.w700,
    fontSize: 14.spa,
  );
  static TextStyle cardText = TextStyle(
      color: ColorManager.descriptionGrey,
      fontWeight: FontWeight.normal,
      fontSize: 12.spa);
  static TextStyle authUnderLineText = TextStyle(
      color: ColorManager.white,
      decoration: TextDecoration.underline,
      decorationColor: ColorManager.white);

  static TextStyle label = TextStyle(
    color: ColorManager.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle caption = TextStyle(
    color: ColorManager.grey,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
}
