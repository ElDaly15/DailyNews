import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContainerOfSelectedNews extends StatelessWidget {
  const ContainerOfSelectedNews({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
    required this.isChecked,
  });

  final String title;
  final IconData iconData;
  final void Function() onTap;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 50,
      decoration: BoxDecoration(
        color: isChecked ? AppColors.secondaryColorTheme : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isChecked
            ? [
                const BoxShadow(
                    color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
              ]
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              iconData,
              color: isChecked ? AppColors.whiteColor : Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyles.font18Medium(context).copyWith(
                color: isChecked ? AppColors.whiteColor : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
