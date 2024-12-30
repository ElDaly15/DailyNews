import 'package:daily_news/featuers/home/presentation/views/widgets/custom_latest_news_tile.dart';
import 'package:flutter/material.dart';

class CustomListViewOfLatestNews extends StatelessWidget {
  const CustomListViewOfLatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: index == 0
              ? const EdgeInsets.only(top: 0, bottom: 12)
              : const EdgeInsets.symmetric(vertical: 12),
          child: const CustomLatestListTile(),
        );
      },
    );
  }
}
