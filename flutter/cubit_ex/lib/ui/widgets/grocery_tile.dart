import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroceryTile extends StatelessWidget {
  final String title;
  final String emoji;

  final VoidCallback onDelete;

  const GroceryTile({
    super.key,
    required this.title,
    required this.emoji,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          /// CIRCLE (Quantity)
          Container(
  width: 40.w,
  height: 40.w,
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Color(0xffEAF6F0),
  ),
  alignment: Alignment.center,
  child: Text(
    emoji,
    style: TextStyle(fontSize: 20.sp),
  ),
),


          SizedBox(width: 12.w),

          /// NAME
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 14.sp),
            ),
          ),

          /// DELETE
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
