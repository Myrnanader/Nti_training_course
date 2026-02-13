import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_manager.dart';
import 'font_manager.dart';

class TextStyles {
  static TextStyle heading = TextStyle(
    fontFamily: FontManager.otama,
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: ColorManager.textPrimary,
  );

  static TextStyle body = TextStyle(
    fontFamily: FontManager.otama,
    fontSize: 16.sp,
    color: ColorManager.textSecondary,
  );
}
