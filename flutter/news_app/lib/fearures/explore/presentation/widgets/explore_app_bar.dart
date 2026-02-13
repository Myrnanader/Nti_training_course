import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/theming/app_fonts.dart';

class ExploreAppBar extends StatelessWidget {
  const ExploreAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('    Explore', style: AppFonts.font24w600),
          //Spacer(),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              context.push(AppRouter.search);
            },
          ),
        ],
      ),
    );
  }
}
