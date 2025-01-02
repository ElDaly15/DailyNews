import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_heading.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_list_view_of_latest_news.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/trending_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewLoading extends StatelessWidget {
  const HomeViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      children: [
        const SafeArea(child: SizedBox()),
        const CustomHomeAppBar(),
        const SizedBox(height: 20),
        Skeletonizer(
          effect: ShimmerEffect(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            duration: const Duration(seconds: 1),
          ),
          enabled: true,
          child: CustomSearchContainer(
            onTap: () {},
          ),
        ),
        const SizedBox(height: 22),
        Skeletonizer(
          effect: ShimmerEffect(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            duration: const Duration(seconds: 1),
          ),
          enabled: true,
          child: CustomHeading(
            mainTitle: 'Trending',
            onTap: () {},
          ),
        ),
        const SizedBox(height: 22),
        Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              duration: const Duration(seconds: 1),
            ),
            enabled: true,
            child: TrendingItem(
              newsModel: NewsModel(
                  sourceName: 'BBC',
                  author: 'BBC',
                  title: 'Russian warship: Moskva sinks in Black Sea',
                  description: 'Russian warship: Moskva sinks in Black Sea',
                  url: 'https://www.bbc.co.uk/news/world-europe-60482520',
                  urlToImage:
                      'https://archive.org/download/placeholder-image/placeholder-image.jpg',
                  publishedAt: '2022-02-24T14:00:00Z',
                  content: 'Russian warship: Moskva sinks in Black Sea'),
            )),
        const SizedBox(height: 22),
        Skeletonizer(
          effect: ShimmerEffect(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            duration: const Duration(seconds: 1),
          ),
          enabled: true,
          child: CustomHeading(
            mainTitle: 'Latest',
            onTap: () {},
          ),
        ),
        const SizedBox(height: 22),
        Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              duration: const Duration(seconds: 1),
            ),
            enabled: true,
            child: CustomListViewOfLatestNews(
              latestNews: [
                NewsModel(
                    sourceName: 'BBC',
                    author: 'BBC',
                    title: 'Russian warship: Moskva sinks in Black Sea',
                    description: 'Russian warship: Moskva sinks in Black Sea',
                    url: 'https://www.bbc.co.uk/news/world-europe-60482520',
                    urlToImage:
                        'https://archive.org/download/placeholder-image/placeholder-image.jpg',
                    publishedAt: '2022-02-24T14:00:00Z',
                    content: 'Russian warship: Moskva sinks in Black Sea'),
                NewsModel(
                    sourceName: 'BBC',
                    author: 'BBC',
                    title: 'Russian warship: Moskva sinks in Black Sea',
                    description: 'Russian warship: Moskva sinks in Black Sea',
                    url: 'https://www.bbc.co.uk/news/world-europe-60482520',
                    urlToImage:
                        'https://archive.org/download/placeholder-image/placeholder-image.jpg',
                    publishedAt: '2022-02-24T14:00:00Z',
                    content: 'Russian warship: Moskva sinks in Black Sea'),
                NewsModel(
                    sourceName: 'BBC',
                    author: 'BBC',
                    title: 'Russian warship: Moskva sinks in Black Sea',
                    description: 'Russian warship: Moskva sinks in Black Sea',
                    url: 'https://www.bbc.co.uk/news/world-europe-60482520',
                    urlToImage:
                        'https://archive.org/download/placeholder-image/placeholder-image.jpg',
                    publishedAt: '2022-02-24T14:00:00Z',
                    content: 'Russian warship: Moskva sinks in Black Sea'),
                NewsModel(
                    sourceName: 'BBC',
                    author: 'BBC',
                    title: 'Russian warship: Moskva sinks in Black Sea',
                    description: 'Russian warship: Moskva sinks in Black Sea',
                    url: 'https://www.bbc.co.uk/news/world-europe-60482520',
                    urlToImage:
                        'https://archive.org/download/placeholder-image/placeholder-image.jpg',
                    publishedAt: '2022-02-24T14:00:00Z',
                    content: 'Russian warship: Moskva sinks in Black Sea'),
              ],
            )),
      ],
    );
  }
}
