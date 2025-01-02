import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_latest_news_tile.dart';
import 'package:flutter/material.dart';

class SliverLoadingListOfLatestNews extends StatelessWidget {
  const SliverLoadingListOfLatestNews({super.key, required this.newsList});
  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // Prevent scrolling if used within another scrollable widget
      shrinkWrap: true, // Allow it to fit within a parent widget
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: index == 0
                ? const EdgeInsets.only(top: 0, bottom: 16)
                : const EdgeInsets.only(bottom: 16),
            // Replace this with your custom list tile
            child: CustomLatestListTile(
                newsModel: newsList[index]) // Example placeholder widget
            );
      },
    );
  }
}
