import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/fearures/explore/presentation/manger/explore_cubit.dart';

import 'package:news_app/fearures/explore/presentation/widgets/explore_card.dart';

class ExploreListView extends StatelessWidget {
  const ExploreListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state is ExploreLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ExploreLoaded) {
          final articles = state.newsModel.articles ?? [];

          if (articles.isEmpty) {
            return const Center(child: Text("No News Found"));
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ExploreCard(article: articles[index]);
            },
          );
        }

        if (state is ExploreError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
