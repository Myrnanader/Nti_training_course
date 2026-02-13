import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/gradients.dart';
import '../../../core/helpers/date_formatter.dart';
import '../../../core/models/note_model.dart';
import '../../../core/theme/font_manager.dart';
import '../../note/logic/note_controller.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  final int index;
  final VoidCallback onTap;

  const NoteCard({
    super.key,
    required this.note,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = noteGradients[note.colorIndex % noteGradients.length];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradient,
          ),
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ───── Top area ─────
            SizedBox(
              height: 56.w, 
              child: Stack(
                children: [
                  /// Number (left)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AppAssets.backContainer,
                          width: 52.w,
                          height: 52.w,
                        ),
                        Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /// Done + Date (right)
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => NoteController.toggleDone(note),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 84.w, 
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: note.isDone
                                  ? const Color(0xFF0E5C4B)
                                  : Colors.white.withOpacity(.22),
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  note.isDone ? "done" : "not",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Icon(
                                  note.isDone ? Icons.check : Icons.close,
                                  size: 14.sp,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          DateFormatter.format(note.timestamp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            /// Title
            Text(
              note.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: FontManager.otama,
              ),
            ),

            SizedBox(height: 6.h),

            /// Description (flexible)
            Expanded(
              child: Text(
                note.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white70,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
