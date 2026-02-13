import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/widgets/app_cached_image.dart';
import 'package:news_app/fearures/home/data/remote_data_source/news_model.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({super.key, required this.article});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: () => context.push(AppRouter.search),
        contentPadding: const EdgeInsets.all(12),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title ?? "No Title",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              article.source?.name ?? "Unknown",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),

        trailing: AppCachedImage(
          imageUrl: article.image,
          height: 80,
          width: 80,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}