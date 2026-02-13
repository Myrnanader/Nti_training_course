import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/fearures/home/data/remote_data_source/news_model.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/fearures/home/repos/newest_news_repo_impl.dart';

part 'latest_news_state.dart';

class LatestNewsCubit extends Cubit<LatestNewsState> {
  final NewestNewsRepoImpl newsRepo;

  LatestNewsCubit({required this.newsRepo}) : super(LatestNewsInitial());

  Future<void> fetchLatestNews() async {
    emit(LatestNewsLoading());

    final Either<Failure, NewsModel> result = await newsRepo.getlatestNews();

    result.fold(
      (failure) => emit(LatestNewsError(message: failure.errMsg)),
      (news) => emit(LatestNewsLoaded(news: news)),
    );
  }
}
