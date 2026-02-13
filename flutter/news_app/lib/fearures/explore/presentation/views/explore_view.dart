import 'package:flutter/material.dart';
import 'package:news_app/fearures/explore/presentation/widgets/explore_body.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Scaffold(body: ExploreBody()),
      ),
    );
  }
}
