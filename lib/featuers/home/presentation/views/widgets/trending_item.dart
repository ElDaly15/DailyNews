import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/featuers/news/presentation/views/news_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as g;

class TrendingItem extends StatelessWidget {
  const TrendingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        g.Get.to(() => const NewsView(),
            transition: g.Transition.fade,
            duration: const Duration(milliseconds: 500));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            height: 200,
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: AppColors.whiteColor,
                    size: 44,
                  ),
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/new-year-background-736885_960_720.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 10),
          Text(
            'Russian warship: Moskva sinks in Black Sea',
            style: TextStyles.font20Regular(context).copyWith(
                color: AppColors.whiteColor, overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.newspaper,
                color: AppColors.whiteColor,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'BBC News',
                style: TextStyles.font14Regular(context)
                    .copyWith(color: const Color.fromARGB(255, 175, 173, 192)),
              ),
              const SizedBox(
                width: 24,
              ),
              const Icon(
                FontAwesomeIcons.clock,
                color: AppColors.whiteColor,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                '2h ago',
                style: TextStyles.font14Regular(context)
                    .copyWith(color: const Color.fromARGB(255, 175, 173, 192)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
