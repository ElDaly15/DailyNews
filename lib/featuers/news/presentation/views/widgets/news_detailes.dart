import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsDetailes extends StatelessWidget {
  const NewsDetailes(
      {super.key, required this.newsModel, required this.postTime});
  final NewsModel newsModel;
  final String postTime;

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
              child: CachedNetworkImage(
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
                imageUrl: newsModel.urlToImage!,
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(height: 20),
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
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.18,
                child: Text(
                  newsModel.sourceName!,
                  style: TextStyles.font14Regular(context).copyWith(
                      color: const Color.fromARGB(255, 175, 173, 192)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
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
              postTime,
              style: TextStyles.font14Regular(context)
                  .copyWith(color: const Color.fromARGB(255, 175, 173, 192)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          newsModel.title!,
          style: TextStyles.font24Medium(context)
              .copyWith(color: AppColors.whiteColor),
        ),
        const SizedBox(height: 10),
        Text(
          newsModel.description!,
          style: TextStyles.font18Regular(context)
              .copyWith(color: const Color.fromARGB(255, 151, 150, 163)),
        ),
      ],
    );
  }
}
