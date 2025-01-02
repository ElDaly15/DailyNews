import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/featuers/news/presentation/views/news_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as g;

class TrendingItem extends StatefulWidget {
  const TrendingItem({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  State<TrendingItem> createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {
  String timeAgo = '';
  @override
  void initState() {
    super.initState();
    String apiDateTime = widget.newsModel.publishedAt!;

    DateTime postedDateTime = DateTime.parse(apiDateTime);

    DateTime now = DateTime.now().toUtc();

    Duration difference = now.difference(postedDateTime);

    timeAgo = formatTimeDifference(difference);
  }

  String formatTimeDifference(Duration difference) {
    if (difference.inDays > 0) {
      return "${difference.inDays} d ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} h ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} m ago";
    } else {
      return "just now";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        g.Get.to(() => const NewsView(),
            transition: g.Transition.fade,
            duration: const Duration(milliseconds: 500));
      },
      child: Column(
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
                  imageUrl: widget.newsModel.urlToImage!,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 10),
          Text(
            widget.newsModel.title!,
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
              FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.18,
                  child: Text(
                    widget.newsModel.author!,
                    style: TextStyles.font14Regular(context).copyWith(
                        color: const Color.fromARGB(255, 175, 173, 192),
                        overflow: TextOverflow.ellipsis),
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
                timeAgo,
                style: TextStyles.font14Regular(context)
                    .copyWith(color: const Color.fromARGB(255, 175, 173, 192)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
