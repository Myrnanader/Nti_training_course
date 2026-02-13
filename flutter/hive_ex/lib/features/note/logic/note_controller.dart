import 'dart:math';

import '../../../core/helpers/hive_helper.dart';
import '../../../core/models/note_model.dart';
import '../../../core/constants/gradients.dart';

class NoteController {
  /// Add new note
  static void addNote({
    required String title,
    required String description,
    required bool isDone,
  }) {
    HiveHelper.notesBox.add(
      NoteModel(
        title: title,
        description: description,
        timestamp: DateTime.now(),
        isDone: isDone,
        colorIndex: Random().nextInt(noteGradients.length),
      ),
    );
  }

  ///  Update existing note
  static void updateNote({
    required NoteModel note,
    required String title,
    required String description,
    required bool isDone,
  }) {
    note
      ..title = title
      ..description = description
      ..isDone = isDone
      ..timestamp = DateTime.now()
      ..save();
  }

  ///  Delete note
  static Future<void> deleteNote(NoteModel note) async {
    await note.delete();
  }

  /// Toggle done / not done 
  static void toggleDone(NoteModel note) {
    note
      ..isDone = !note.isDone
      ..save();
  }
}
