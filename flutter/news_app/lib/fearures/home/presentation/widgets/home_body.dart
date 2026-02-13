import 'package:flutter/material.dart';
import 'package:news_app/core/theming/app_fonts.dart';
import 'package:news_app/fearures/home/presentation/widgets/home_app_bar..dart';
import 'package:news_app/fearures/home/presentation/widgets/latest_news_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeAppBar(),

          SizedBox(height: 24),

          LatestNewsListView(),

          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Just For You', style: AppFonts.font16w700),
                Text(
                  'See more',
                  style: AppFonts.font12w400.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),
          LatestNewsListView(),
        ],
      ),
    );
  }
}
