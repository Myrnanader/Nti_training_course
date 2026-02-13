import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/fearures/home/data/remote_data_source/news_model.dart';

abstract class NewsRepo {
  Future<Either<Failure, NewsModel>> getlatestNews();
}
