import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/trending_item.dart';
import 'package:flutter/material.dart';

class ListViewOfTrendingNews extends StatelessWidget {
  const ListViewOfTrendingNews({super.key, required this.newsList});
  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: index == 0
              ? const EdgeInsets.only(top: 0, bottom: 16)
              : const EdgeInsets.only(bottom: 16),
          child: TrendingItem(
            newsModel: newsList[index],
          ),
        );
      }, childCount: newsList.length),
    );
  }
}
