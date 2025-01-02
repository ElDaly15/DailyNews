import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/featuers/trending/presentation/views/widgets/trending_view_body.dart';
import 'package:flutter/material.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key, required this.newsList});
  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorTheme,
      body: TrendingViewBody(
        newsList: newsList,
      ),
    );
  }
}
