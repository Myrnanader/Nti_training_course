import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ex/features/note/ui/alert_bottom_sheet.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/color_manager.dart';

import '../../../core/widgets/alert_type.dart';
import '../logic/note_controller.dart';
import '../../../core/models/note_model.dart';
import '../widgets/note_form.dart';

class NewNoteScreen extends StatefulWidget {
  final NoteModel? note;

  const NewNoteScreen({super.key, this.note});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      descController.text = widget.note!.description;
    }
  }

  void _save() {
    ///  Validation
    if (titleController.text.trim().isEmpty ||
        descController.text.trim().isEmpty) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) => const AlertBottomSheet(type: AlertType.validation),
      );
      return;
    }

    /// 2 Add new note (no confirmation)
    if (widget.note == null) {
      NoteController.addNote(
        title: titleController.text,
        description: descController.text,
        isDone: false,
      );
      context.go(Routes.home);
      return;
    }

    ///  Edit existing note (confirm)
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => AlertBottomSheet(
        type: AlertType.confirmEdit,
        onConfirm: () {
          NoteController.updateNote(
            note: widget.note!,
            title: titleController.text,
            description: descController.text,
            isDone: widget.note!.isDone,
          );
          context.go(Routes.home);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              /// ───── Top bar ─────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),

                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (_) => AlertBottomSheet(
                          type: AlertType.confirmEdit,
                          onConfirm: () {
                            context.go(Routes.home);
                          },
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: _save,
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Image.asset(
                        AppAssets.noteCheckCircle,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// ───── Form ─────
              Expanded(
                child: NoteForm(
                  titleController: titleController,
                  descController: descController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
