import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/featuers/news/presentation/views/widgets/news_view_body.dart';
import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key, required this.newsModel, required this.postTime});
  final NewsModel newsModel;
  final String postTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorTheme,
      body: NewsViewBody(
        newsModel: newsModel,
        postTime: postTime,
      ),
    );
  }
}
