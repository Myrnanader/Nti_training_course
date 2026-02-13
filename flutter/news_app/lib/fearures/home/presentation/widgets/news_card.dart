import 'package:flutter/material.dart';
import 'package:news_app/core/theming/app_fonts.dart';
import 'package:news_app/core/widgets/app_cached_image.dart';
import 'package:news_app/fearures/home/data/remote_data_source/news_model.dart';

class NewsCard extends StatelessWidget {
  final Articles article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCachedImage(
            imageUrl: article.image,
            height: 120,
            width: double.infinity,
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              article.title ?? 'No Title',
              style: AppFonts.font12w400,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              article.description ?? 'No Description',
              style: AppFonts.font12w400.copyWith(color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}