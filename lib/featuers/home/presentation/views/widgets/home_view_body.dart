import 'package:daily_news/featuers/home/presentation/views/widgets/custom_heading.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_list_view_of_latest_news.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/trending_item.dart';
import 'package:daily_news/featuers/trending/presentation/views/trending_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SafeArea(child: SizedBox()),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomHomeAppBar(),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomSearchContainer(
              onTap: () {},
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 22),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomHeading(
              mainTitle: 'Trending',
              onTap: () {
                g.Get.to(() => const TrendingView(),
                    transition: g.Transition.fade,
                    duration: const Duration(milliseconds: 500));
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 22),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: TrendingItem(),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 22),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomHeading(
              mainTitle: 'Latest',
              onTap: () {},
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 22),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomListViewOfLatestNews(),
          ),
        ),
      ],
    );
  }
}
