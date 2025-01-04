import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class ErrorSearchWidget extends StatelessWidget {
  const ErrorSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            Assets.imagesNresult,
            width: MediaQuery.of(context).size.width * 0.6,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'No Results Found',
          style: TextStyles.font22Bold(context)
              .copyWith(color: AppColors.whiteColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class StartSearchWidget extends StatelessWidget {
  const StartSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            Assets.imagesSsearch,
            width: MediaQuery.of(context).size.width * 0.6,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Text(
          'Start Search For News',
          style: TextStyles.font22Bold(context)
              .copyWith(color: AppColors.whiteColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
