import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/fearures/explore/repo/explore_repo.dart';
import 'package:news_app/fearures/home/data/remote_data_source/news_model.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final ExploreRepo exploreRepo;

  ExploreCubit({required this.exploreRepo}) : super(ExploreInitial());

  Future<void> fetchCategoryNews(String category) async {
    emit(ExploreLoading());

    Either<Failure, NewsModel> result = await exploreRepo.getNewsByCategory(
      category: category,
    );

    result.fold(
      (failure) => emit(ExploreError(message: failure.errMsg)),
      (newsModel) => emit(ExploreLoaded(newsModel: newsModel)),
    );
  }
}
