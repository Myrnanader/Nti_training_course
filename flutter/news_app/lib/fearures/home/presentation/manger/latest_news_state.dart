part of 'latest_news_cubit.dart';

@immutable
abstract class LatestNewsState {}

class LatestNewsInitial extends LatestNewsState {}

class LatestNewsLoading extends LatestNewsState {}

class LatestNewsLoaded extends LatestNewsState {
  final NewsModel news;

  LatestNewsLoaded({required this.news});
}

class LatestNewsError extends LatestNewsState {
  final String message;

  LatestNewsError({required this.message});
}
