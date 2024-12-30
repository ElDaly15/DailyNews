import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading(
      {super.key, required this.mainTitle, required this.onTap});
  final String mainTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          mainTitle,
          style: TextStyles.font22Bold(context)
              .copyWith(color: AppColors.whiteColor),
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            'See All',
            style: TextStyles.font14Regular(context)
                .copyWith(color: AppColors.subTitleColor),
          ),
        ),
      ],
    );
  }
}
