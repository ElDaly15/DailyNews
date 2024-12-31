import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/featuers/latest/presentation/views/widgets/latest_news_view_body.dart';
import 'package:flutter/material.dart';

class LatestNewsView extends StatelessWidget {
  const LatestNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainColorTheme,
      body: LatestNewsViewBody(),
    );
  }
}
