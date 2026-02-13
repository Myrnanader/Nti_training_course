import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/fearures/home/presentation/manger/latest_news_cubit.dart';
import 'package:news_app/fearures/home/presentation/widgets/news_card.dart';

class LatestNewsListView extends StatelessWidget {
  const LatestNewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BlocBuilder<LatestNewsCubit, LatestNewsState>(
        builder: (context, state) {
          if (state is LatestNewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LatestNewsLoaded) {
            final articles = state.news.articles ?? [];

            if (articles.isEmpty) {
              return const Center(child: Text('No news available.'));
            }

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NewsCard(article: article),
                );
              },
            );
          } else if (state is LatestNewsError) {
            return Center(child: Text(state.message));
          }

          return Container();
        },
      ),
    );
  }
}
