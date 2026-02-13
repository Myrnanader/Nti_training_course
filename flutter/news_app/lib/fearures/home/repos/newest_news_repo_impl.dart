import 'package:dartz/dartz.dart';
import 'package:news_app/core/constants/app_strings.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/networking/dio_serveses.dart';
import 'package:news_app/fearures/home/data/remote_data_source/news_model.dart';
import 'package:news_app/fearures/home/repos/newest_news_repo.dart';

import 'package:news_app/core/networking/api_constants.dart';

class NewestNewsRepoImpl implements NewsRepo {
  final ApiServices apiServices;

  NewestNewsRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, NewsModel>> getlatestNews() async {
    try {
      final queryParameters = {
        'category': 'general',
        'apikey': Api_Key,
        'max': 10,
        'lang': 'en',
      };

      final response = await apiServices.get(
        endPoint: ApiConstants.TopHeadLine_EndPoint,
        queryParameters: queryParameters,
      );

      final newsModel = NewsModel.fromJson(response.data);

      return Right(newsModel);
    } catch (e) {
      return Left(Failure(errMsg: e.toString()));
    }
  }
}
