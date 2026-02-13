import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/app_strings.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/networking/api_constants.dart';
import 'package:news_app/core/networking/dio_serveses.dart';
import 'package:news_app/fearures/home/data/remote_data_source/news_model.dart';
import 'package:news_app/fearures/search/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, NewsModel>> searchNews({required String query}) async {
    try {
      final response = await apiServices.get(
        endPoint: ApiConstants.search,
        queryParameters: {
          "q": query,
          "apikey": Api_Key,
          "lang": "en",
          "max": 10,
          "in": "title,description",
          "sortby": "relevance",
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
