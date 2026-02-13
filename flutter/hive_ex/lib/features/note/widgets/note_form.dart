import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class NoteForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descController;

  const NoteForm({
    super.key,
    required this.titleController,
    required this.descController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: titleController,
          style: TextStyles.heading.copyWith(fontSize: 24.sp),
          decoration: const InputDecoration(
            hintText: "Title",
            border: InputBorder.none,
          ),
        ),
        SizedBox(height: 12.h),
        Expanded(
          child: TextField(
            controller: descController,
            style: TextStyles.body,
            decoration: const InputDecoration(
              hintText: "Type something...",
              border: InputBorder.none,
            ),
            maxLines: null,
            expands: true,
          ),
        ),
      ],
    );
  }
}
