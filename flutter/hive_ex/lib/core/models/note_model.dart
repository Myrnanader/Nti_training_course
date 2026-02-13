import 'package:hive_ce/hive_ce.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime timestamp;

  @HiveField(3)
  bool isDone;

  @HiveField(4)
  int colorIndex; 

  NoteModel({
    required this.title,
    required this.description,
    required this.timestamp,
    this.isDone = false,
    this.colorIndex = 0,
  });
}

