import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final double? width;
  final bool? isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.hintText,
    this.width,
    this.suffixIcon,
    this.isPassword,
    this.controller,
    this.validator,
    this.prefixIcon

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331,
      child: TextFormField(
        controller: controller,
        style:TextStyle(color:Color(0xffFFFFFF), ),
        validator: validator,
        autofocus: false,
        obscureText: isPassword ?? false,
        cursorColor: const Color(0xFF00BDA4),
        decoration: InputDecoration(
          hintText: hintText ?? " ",
          hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color:Color(0xffFFFFFF),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          prefixIcon: isPassword == true
              ? const Icon(Icons.lock_outline, color: Color(0xff00BDA4))
              : const Icon(Icons.person_outline, color: Color(0xff00BDA4)),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xff0F2321B2), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xff00BDA4), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          filled: true,
          fillColor: const Color(0xff0F2321B2),
        ),
      ),
    );
  }
}