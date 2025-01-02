import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_images.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/core/widgets/headers/custom_app_header.dart';
import 'package:flutter/material.dart';

class CustomTrendingErrorWidget extends StatelessWidget {
  const CustomTrendingErrorWidget({super.key, required this.errorMsg});
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          const SafeArea(child: SizedBox()),
          const SizedBox(height: 20),
          const CustomViewsAppBar(
            title: 'Trending',
          ),
          const SizedBox(height: 20),
          const Spacer(),
          Image.asset(Assets.imagesError),
          Text(
            'An Error Occurred , Please Try Again',
            style: TextStyles.font22Bold(context).copyWith(
                color: AppColors.whiteColor,
                fontSize: MediaQuery.of(context).size.width * 0.04),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
