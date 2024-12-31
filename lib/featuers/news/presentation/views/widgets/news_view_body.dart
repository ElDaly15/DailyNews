import 'package:daily_news/featuers/news/presentation/views/widgets/custom_news_app_bar.dart';
import 'package:daily_news/featuers/news/presentation/views/widgets/news_detailes.dart';
import 'package:flutter/material.dart';

class NewsViewBody extends StatelessWidget {
  const NewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            SafeArea(child: SizedBox()),
            CustomNewsAppBar(),
            SizedBox(
              height: 20,
            ),
            NewsDetailes(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
