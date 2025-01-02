import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/core/widgets/headers/custom_app_header.dart';
import 'package:daily_news/featuers/trending/presentation/views/widgets/list_view_of_trending_items.dart';
import 'package:flutter/material.dart';

class TrendingViewBody extends StatelessWidget {
  const TrendingViewBody({super.key, required this.newsList});
  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
