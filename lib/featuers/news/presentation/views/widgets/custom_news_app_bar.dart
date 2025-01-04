import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/featuers/news/presentation/views/web_news_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;

class CustomNewsAppBar extends StatelessWidget {
  const CustomNewsAppBar({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          alignment: Alignment.centerLeft,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.share,
            color: Colors.white,
          ),
          onPressed: () {
            g.Get.to(
                () => WebNewsPreview(
                      newsUrl: news.url!,
                    ),
                transition: g.Transition.fade,
                duration: const Duration(milliseconds: 500));
          },
        ),
      ],
    );
  }
}
