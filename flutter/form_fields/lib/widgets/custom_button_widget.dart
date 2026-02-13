
import 'package:flutter/material.dart';


class PrimaryButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final void Function()? onPress;
  const PrimaryButtonWidget({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.fontSize,
    this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? Color(0xff00BDA4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 30),
        ),
        fixedSize: Size(width ?? 342, height ?? 56),
      ),
      child: Text(
        buttonText ?? " ",
        style: TextStyle(
          color: textColor ?? Color(0xff0F2321),
          fontWeight: FontWeight.bold,
          fontSize: fontSize?? 16,
          letterSpacing: 3.2,
        ),
      ),
    );
  }
}
