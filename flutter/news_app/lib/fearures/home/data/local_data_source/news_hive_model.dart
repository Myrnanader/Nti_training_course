import 'package:hive_ce_flutter/hive_ce_flutter.dart';

//part 'news_model_hive.g.dart';

@HiveType(typeId: 0)
class NewsHiveModel {
  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String? description;

  @HiveField(2)
  final String? imageUrl;

  @HiveField(3)
  final String? source;

  NewsHiveModel({this.title, this.description, this.imageUrl, this.source});
}
