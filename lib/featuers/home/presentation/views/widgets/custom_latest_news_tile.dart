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
              child: Image.asset(
                'assets/images/test.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
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
