import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/fearures/explore/presentation/manger/explore_cubit.dart';

class ExploreTabBar extends StatefulWidget {
  const ExploreTabBar({super.key});

  @override
  State<ExploreTabBar> createState() => _ExploreTabBarState();
}

class _ExploreTabBarState extends State<ExploreTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final List<String> categories = [
    "general",
    "world",
    "nation",
    "business",
    "technology",
    "entertainment",
    "sports",
    "science",
    "health",
  ];

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: categories.length, vsync: this);

    context.read<ExploreCubit>().fetchCategoryNews(categories[0]);

    tabController.addListener(() {
      if (tabController.indexIsChanging) return;

      context.read<ExploreCubit>().fetchCategoryNews(
        categories[tabController.index],
      );
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      indicatorColor: Colors.blue,
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      tabs: categories.map((c) => Tab(text: c.toUpperCase())).toList(),
    );
  }
}
