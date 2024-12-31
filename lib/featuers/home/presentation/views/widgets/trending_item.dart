import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrendingItem extends StatelessWidget {
  const TrendingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            child: Image.asset(
              'assets/images/test.jpg',
              fit: BoxFit.cover,
            ),
          ),
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
    );
  }
}
