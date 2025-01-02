import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/featuers/news/presentation/views/news_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as g;

class CustomLatestListTile extends StatefulWidget {
  const CustomLatestListTile({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  State<CustomLatestListTile> createState() => _CustomLatestListTileState();
}

class _CustomLatestListTileState extends State<CustomLatestListTile> {
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
      return "${difference.inDays}d ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours}h ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes}m ago";
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
      child: SizedBox(
        height: 100, // Provide a fixed height to prevent unbounded constraints
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  width: 100,
                  height: 100,
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
            const SizedBox(width: 10),
            Expanded(
              // This wraps only the column to allow it to take available space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.bookOpenReader,
                        color: AppColors.whiteColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.newsModel.author!,
                        style: TextStyles.font14Regular(context).copyWith(
                          color: const Color.fromARGB(255, 175, 173, 192),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    widget.newsModel.title!,
                    style: TextStyles.font22Regular(context).copyWith(
                      color: AppColors.whiteColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  const Spacer(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.newspaper,
                        color: AppColors.whiteColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                          child: Text(
                            widget.newsModel.sourceName!,
                            style: TextStyles.font14Regular(context).copyWith(
                              color: const Color.fromARGB(255, 175, 173, 192),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Icon(
                        FontAwesomeIcons.clock,
                        color: AppColors.whiteColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        timeAgo,
                        style: TextStyles.font14Regular(context).copyWith(
                          color: const Color.fromARGB(255, 175, 173, 192),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
