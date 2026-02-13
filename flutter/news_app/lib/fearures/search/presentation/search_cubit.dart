import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/fearures/home/data/remote_data_source/news_model.dart';
import 'package:news_app/fearures/search/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  Future<void> search(String query) async {
    if (query.isEmpty) return;

    emit(SearchLoading());

    Either<Failure, NewsModel> result = await searchRepo.searchNews(
      query: query,
    );

    result.fold(
      (failure) => emit(SearchError(message: failure.errMsg)),
      (newsModel) => emit(SearchLoaded(newsModel: newsModel)),
    );
  }
}
