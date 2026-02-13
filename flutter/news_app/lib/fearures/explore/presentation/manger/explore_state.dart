part of 'explore_cubit.dart';

@immutable
abstract class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final NewsModel newsModel;

  ExploreLoaded({required this.newsModel});
}

class ExploreError extends ExploreState {
  final String message;

  ExploreError({required this.message});
}
