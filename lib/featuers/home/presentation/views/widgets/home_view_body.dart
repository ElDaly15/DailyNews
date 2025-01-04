import 'package:daily_news/core/loading/home_view_loading.dart';
import 'package:daily_news/core/widgets/errors/custom_error_widget.dart';
import 'package:daily_news/featuers/home/presentation/manager/get_latest_news_cubit/get_latest_news_cubit.dart';
import 'package:daily_news/featuers/home/presentation/manager/get_trending_news_cubit/get_trending_news_cubit.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_heading.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_list_view_of_latest_news.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/trending_item.dart';
import 'package:daily_news/featuers/latest/presentation/views/latest_news_view.dart';
import 'package:daily_news/featuers/search/presentation/views/search_view.dart';
import 'package:daily_news/featuers/trending/presentation/views/trending_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as g;

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLatestNewsCubit, GetLatestNewsState>(
      builder: (context, lastState) {
        return BlocBuilder<GetTrendingNewsCubit, GetTrendingNewsState>(
          builder: (context, state) {
            if (state is GetTrendingNewsSuccess &&
                lastState is GetLatestNewsSuccess) {
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
                        onTap: () {
                          g.Get.to(() => const SearchView(),
                              transition: g.Transition.fade,
                              duration: const Duration(milliseconds: 500));
                        },
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
                          g.Get.to(
                              () => TrendingView(
                                    newsList: state.news,
                                  ),
                              transition: g.Transition.fade,
                              duration: const Duration(milliseconds: 500));
                        },
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 22),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    sliver: SliverToBoxAdapter(
                      child: TrendingItem(
                        newsModel: state.news[0],
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
                        mainTitle: 'Latest',
                        onTap: () {
                          g.Get.to(() => const LatestNewsView(),
                              transition: g.Transition.fade,
                              duration: const Duration(milliseconds: 500));
                        },
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 22),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    sliver: SliverToBoxAdapter(
                      child: CustomListViewOfLatestNews(
                        isSearch: false,
                        latestNews: lastState.newsList,
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is GetTrendingNewsFailuer ||
                lastState is GetLatestNewsFailuer) {
              return const CustomErrorWidget(
                errorMsg: 'Something went wrong',
              );
            } else {
              return const HomeViewLoading();
            }
          },
        );
      },
    );
  }
}
