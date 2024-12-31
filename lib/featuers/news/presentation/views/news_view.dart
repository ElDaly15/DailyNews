import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/featuers/news/presentation/views/widgets/news_view_body.dart';
import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainColorTheme,
      body: NewsViewBody(),
    );
  }
}
