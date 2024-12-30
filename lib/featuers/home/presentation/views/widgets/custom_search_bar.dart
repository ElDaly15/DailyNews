import 'package:daily_news/core/utils/app_images.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomSearchContainer extends StatelessWidget {
  final Function()? onTap;
  const CustomSearchContainer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(Assets.imagesSearch)),
            Text('Search',
                style: TextStyles.font18Regular(context)
                    .copyWith(color: AppColors.subTitleColor)),
          ],
        ),
      ),
    );
  }
}
