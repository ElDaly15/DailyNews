import 'package:daily_news/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;

import '../../utils/app_colors.dart';

class CustomViewsAppBar extends StatelessWidget {
  const CustomViewsAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
          onPressed: () {
            g.Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
        ),
        const Spacer(),
        Text(title,
            style: TextStyles.font20Medium(context)
                .copyWith(color: AppColors.whiteColor)),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.bookmark,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
