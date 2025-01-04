import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/featuers/news/presentation/views/widgets/custom_news_app_bar.dart';
import 'package:daily_news/featuers/news/presentation/views/widgets/news_detailes.dart';
import 'package:flutter/material.dart';

class NewsViewBody extends StatelessWidget {
  const NewsViewBody(
      {super.key, required this.newsModel, required this.postTime});
  final NewsModel newsModel;
  final String postTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            const SafeArea(child: SizedBox()),
            CustomNewsAppBar(
              news: newsModel,
            ),
            const SizedBox(
              height: 20,
            ),
            NewsDetailes(
              newsModel: newsModel,
              postTime: postTime,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
