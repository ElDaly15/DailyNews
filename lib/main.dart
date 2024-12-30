import 'package:daily_news/featuers/splash/presentation/views/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      DevicePreview(enabled: true, builder: (context) => const WorldNewsApp()));
}

class WorldNewsApp extends StatelessWidget {
  const WorldNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
