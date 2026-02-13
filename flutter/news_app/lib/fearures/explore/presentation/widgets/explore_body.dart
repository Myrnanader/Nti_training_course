import 'package:flutter/material.dart';
import 'package:news_app/fearures/explore/presentation/widgets/explore_app_bar.dart';
import 'package:news_app/fearures/explore/presentation/widgets/explore_frist_section.dart';
import 'package:news_app/fearures/explore/presentation/widgets/explore_list_view.dart';
import 'package:news_app/fearures/explore/presentation/widgets/explore_tqp_bar.dart';

class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: ExploreAppBar()),

        SliverToBoxAdapter(child: ExploreTabBar()),

        SliverToBoxAdapter(child: SizedBox(height: 12)),

        SliverToBoxAdapter(child: ExploreFristSection()),

        SliverFillRemaining(child: ExploreListView()),
      ],
    );
  }
}
