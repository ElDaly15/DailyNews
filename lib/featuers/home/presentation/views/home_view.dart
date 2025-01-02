import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/featuers/home/presentation/manager/get_trending_news_cubit/get_trending_news_cubit.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.mainColorTheme,
      onRefresh: () async {
        BlocProvider.of<GetTrendingNewsCubit>(context)
            .getTrendingNews(q: 'world');
      },
      child: const Scaffold(
        backgroundColor: AppColors.mainColorTheme,
        body: HomeViewBody(),
      ),
    );
  }
}
