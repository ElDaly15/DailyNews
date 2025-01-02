import 'package:daily_news/featuers/home/presentation/manager/get_latest_news_cubit/get_latest_news_cubit.dart';
import 'package:daily_news/featuers/home/presentation/manager/get_trending_news_cubit/get_trending_news_cubit.dart';
import 'package:daily_news/featuers/splash/presentation/views/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  if (kReleaseMode) {
    runApp(const WorldNewsApp());
  } else {
    runApp(DevicePreview(
        enabled: true, builder: (context) => const WorldNewsApp()));
  }
}

class WorldNewsApp extends StatelessWidget {
  const WorldNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetTrendingNewsCubit()..getNews(q: 'world'),
        ),
        BlocProvider(
          create: (context) => GetLatestNewsCubit()..getNews(q: 'egypt'),
        ),
      ],
      child: GetMaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
