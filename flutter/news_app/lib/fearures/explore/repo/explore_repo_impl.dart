import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/app_strings.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/networking/api_constants.dart';
import 'package:news_app/core/networking/dio_serveses.dart';
import 'package:news_app/fearures/explore/repo/explore_repo.dart';

import 'package:news_app/fearures/home/data/remote_data_source/news_model.dart';

class ExploreRepoImpl implements ExploreRepo {
  final ApiServices apiServices;

  ExploreRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, NewsModel>> getNewsByCategory({
    required String category,
  }) async {
    try {
      final response = await apiServices.get(
        endPoint: ApiConstants.TopHeadLine_EndPoint,
        queryParameters: {
          "category": category,
          "apikey": Api_Key,
          "lang": "en",
          "max": 10,
        },
      );

      final newsModel = NewsModel.fromJson(response.data);
      return Right(newsModel);
    } on DioException catch (e) {
      return Left(Failure(errMsg: e.message ?? "Dio Error"));
    } catch (e) {
      return Left(Failure(errMsg: e.toString()));
    }
  }
}
