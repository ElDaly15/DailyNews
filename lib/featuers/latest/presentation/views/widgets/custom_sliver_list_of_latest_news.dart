import 'package:flutter/material.dart';

class CustomSliverOfLatestNews extends StatelessWidget {
  const CustomSliverOfLatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: index == 0
              ? const EdgeInsets.only(top: 0, bottom: 16)
              : const EdgeInsets.only(bottom: 16),
          // child: const CustomLatestListTile(),
        );
      }, childCount: 5),
    );
  }
}
