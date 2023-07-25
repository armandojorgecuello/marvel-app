import 'package:app_marvel/generated/l10n.dart';
import 'package:app_marvel/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Marvel App",
      supportedLocales: I18n.delegate.supportedLocales,
      localizationsDelegates: const [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashScreen(),
    );
  }
}