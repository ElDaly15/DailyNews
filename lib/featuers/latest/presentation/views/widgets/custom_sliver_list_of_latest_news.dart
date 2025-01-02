import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_latest_news_tile.dart';
import 'package:flutter/material.dart';

class CustomSliverOfLatestNews extends StatelessWidget {
  const CustomSliverOfLatestNews({super.key, required this.newsList});
  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: index == 0
              ? const EdgeInsets.only(top: 0, bottom: 16)
              : const EdgeInsets.only(bottom: 16),
          child: CustomLatestListTile(
            newsModel: newsList[index],
          ),
        );
      }, childCount: newsList.length),
    );
  }
}
