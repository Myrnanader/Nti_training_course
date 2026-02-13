import 'package:flutter/material.dart';
import 'color_manager.dart';

class TextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: ColorManager.whiteColor,
  );

  static const TextStyle label = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: ColorManager.grey1Color,
  );

  static const TextStyle number = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900,
    color: ColorManager.whiteColor,
  );

  static const TextStyle button = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: ColorManager.whiteColor,
  );
}