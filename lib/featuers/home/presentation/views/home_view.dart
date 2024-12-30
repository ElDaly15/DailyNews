import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainColorTheme,
      body: HomeViewBody(),
    );
  }
}
