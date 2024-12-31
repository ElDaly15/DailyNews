import 'package:daily_news/core/widgets/headers/custom_app_header.dart';
import 'package:flutter/material.dart';

class TrendingViewBody extends StatelessWidget {
  const TrendingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          SafeArea(child: SizedBox()),
          CustomViewsAppBar(
            title: 'Trending',
          ),
        ],
      ),
    );
  }
}
