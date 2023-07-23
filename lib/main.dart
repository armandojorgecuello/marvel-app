import 'package:app_marvel/enviroment.dart';
import 'package:app_marvel/marvel_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  await dotenv.load(fileName:Enviroment.filenName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MarvelApp()
    );
  }
}