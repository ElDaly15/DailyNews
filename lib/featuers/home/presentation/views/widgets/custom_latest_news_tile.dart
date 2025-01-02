import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/featuers/news/presentation/views/news_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as g;

class CustomLatestListTile extends StatelessWidget {
  const CustomLatestListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        g.Get.to(() => const NewsView(),
            transition: g.Transition.fade,
            duration: const Duration(milliseconds: 500));
      },
      child: SizedBox(
        height: 100, // Provide a fixed height to prevent unbounded constraints
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  width: 100,
                  height: 100,
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
            const SizedBox(width: 10),
            Expanded(
              // This wraps only the column to allow it to take available space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.bookOpenReader,
                        color: AppColors.whiteColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Ahmed Abdullah',
                        style: TextStyles.font14Regular(context).copyWith(
                          color: const Color.fromARGB(255, 175, 173, 192),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'Russian warship: Moskva sinks in Black Sea . Russian warship: Moskva sinks in Black Sea . Russian warship: Moskva sinks in Black Sea .',
                    style: TextStyles.font22Regular(context).copyWith(
                      color: AppColors.whiteColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  const Spacer(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.newspaper,
                        color: AppColors.whiteColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'BBC News',
                        style: TextStyles.font14Regular(context).copyWith(
                          color: const Color.fromARGB(255, 175, 173, 192),
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Icon(
                        FontAwesomeIcons.clock,
                        color: AppColors.whiteColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '2h ago',
                        style: TextStyles.font14Regular(context).copyWith(
                          color: const Color.fromARGB(255, 175, 173, 192),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
