import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import '../models/note_model.dart';

class HiveHelper {
  static const String notesBoxName = 'notesBox';
  static const String settingsBoxName = 'settingsBox';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());

    await Hive.openBox<NoteModel>(notesBoxName);
    await Hive.openBox(settingsBoxName);
  }

  static Box<NoteModel> get notesBox =>
      Hive.box<NoteModel>(notesBoxName);

  static Box get settingsBox =>
      Hive.box(settingsBoxName);
}
