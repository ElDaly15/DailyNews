import 'package:daily_news/core/loading/fake_list_of_news.dart';
import 'package:daily_news/core/loading/loading_list_view_of_trending_items.dart';
import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/core/widgets/headers/custom_app_header.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TrendingViewLoading extends StatelessWidget {
  const TrendingViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SafeArea(child: SizedBox()),
          const CustomViewsAppBar(
            title: 'Trending',
          ),
          const SizedBox(height: 10),
          Text(
            'Trending News',
            style: TextStyles.font22Bold(context)
                .copyWith(color: AppColors.whiteColor),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Skeletonizer(
              effect: ShimmerEffect(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                duration: const Duration(seconds: 1),
              ),
              enabled: true,
              child: ListViewOfTrendingNewsLoading(
                newsList: fakeListOfNews,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
