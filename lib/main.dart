import 'package:daily_news/featuers/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const WorldNewsApp());
}

class WorldNewsApp extends StatelessWidget {
  const WorldNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
