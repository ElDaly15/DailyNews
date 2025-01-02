import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMsg});
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          const SafeArea(child: SizedBox()),
          const SizedBox(height: 20),
          const CustomHomeAppBar(),
          const SizedBox(height: 20),
          const Spacer(),
          Image.asset('assets/images/error.png'),
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
