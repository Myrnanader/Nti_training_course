import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ex/core/widgets/alert_type.dart';
import 'package:hive_ex/features/note/ui/alert_bottom_sheet.dart';

import '../../../core/models/note_model.dart';
import '../../../core/routing/routes.dart';
import '../logic/note_controller.dart';

class NoteDetailsScreen extends StatelessWidget {
  final NoteModel note;

  const NoteDetailsScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.go(Routes.newNote, extra: note);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => AlertBottomSheet(
                  type: AlertType.confirmDelete,
                  onConfirm: () {
                    NoteController.deleteNote(note);
                    context.go(Routes.home);
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(note.description),
      ),
    );
  }
}
