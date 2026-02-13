import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Groceries',
      style: TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
