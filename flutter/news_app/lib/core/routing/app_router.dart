import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/networking/dio_serveses.dart';
import 'package:news_app/fearures/explore/presentation/manger/explore_cubit.dart';
import 'package:news_app/fearures/explore/repo/explore_repo_impl.dart';
import 'package:news_app/fearures/home/presentation/manger/latest_news_cubit.dart';
import 'package:news_app/fearures/home/presentation/views/home_veiw.dart';
import 'package:news_app/fearures/home/repos/newest_news_repo_impl.dart';
import 'package:news_app/fearures/on_boarding/presentation/on_boarding_view.dart';
import 'package:news_app/fearures/search/presentation/search_cubit.dart';
import 'package:news_app/fearures/search/presentation/search_view.dart';
import 'package:news_app/fearures/search/repo/search_repo_impl.dart';

class AppRouter {
  static const onBoarding = '/onBoarding';
  static const home = '/home';
  static const search = '/search';

  static final GoRouter routes = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(path: onBoarding, builder: (context, state) => OnBoardingView()),
      GoRoute(
        path: home,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LatestNewsCubit(
                newsRepo: NewestNewsRepoImpl(apiServices: ApiServices()),
              )..fetchLatestNews(),
            ),
            BlocProvider(
              create: (context) => ExploreCubit(
                exploreRepo: ExploreRepoImpl(apiServices: ApiServices()),
              ),
            ),
          ],
          child: HomeView(),
        ),
      ),

      GoRoute(
        path: search,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            searchRepo: SearchRepoImpl(apiServices: ApiServices()),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
