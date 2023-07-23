import 'package:app_marvel/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Marvel App",
      home: SplashScreen(),
    );
  }
}