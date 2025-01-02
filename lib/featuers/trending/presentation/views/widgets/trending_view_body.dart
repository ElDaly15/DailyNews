// ignore_for_file: use_build_context_synchronously

import 'package:daily_news/core/loading/trending_view_loading.dart';
import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/core/widgets/errors/custom_trending_error_widget.dart';
import 'package:daily_news/core/widgets/headers/custom_app_header.dart';
import 'package:daily_news/featuers/home/presentation/manager/get_trending_news_cubit/get_trending_news_cubit.dart';
import 'package:daily_news/featuers/trending/presentation/views/widgets/list_view_of_trending_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingViewBody extends StatelessWidget {
  const TrendingViewBody({super.key, required this.newsList});
  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTrendingNewsCubit, GetTrendingNewsState>(
      builder: (context, state) {
        if (state is GetTrendingNewsSuccess) {
          return RefreshIndicator(
            color: AppColors.mainColorTheme,
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
              BlocProvider.of<GetTrendingNewsCubit>(context)
                  .getNews(q: 'world');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SafeArea(child: SizedBox())),
                  const SliverToBoxAdapter(
                    child: CustomViewsAppBar(
                      title: 'Trending',
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                  SliverToBoxAdapter(
                    child: Text(
                      'Trending News',
                      style: TextStyles.font22Bold(context)
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  ListViewOfTrendingNews(
                    newsList: newsList,
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetTrendingNewsLoading) {
          return const TrendingViewLoading();
        }
        return const CustomTrendingErrorWidget(title: 'Trending');
      },
    );
  }
}
