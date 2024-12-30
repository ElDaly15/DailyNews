import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_images.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_heading.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          const SafeArea(child: SizedBox()),
          const CustomHomeAppBar(),
          const SizedBox(height: 20),
          CustomSearchContainer(
            onTap: () {},
          ),
          const SizedBox(height: 22),
          CustomHeading(
            mainTitle: 'Trending',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
