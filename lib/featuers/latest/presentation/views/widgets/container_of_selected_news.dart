import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContainerOfSelectedNews extends StatelessWidget {
  const ContainerOfSelectedNews(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});
  final String title;
  final IconData iconData;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(iconData),
              const SizedBox(
                width: 10,
              ),
              Text(title, style: TextStyles.font18Medium(context).copyWith())
            ],
          ),
        ),
      ),
    );
  }
}
