import 'package:app_marvel/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  navigateTo({required BuildContext context}){
    Future.delayed(
        const Duration(milliseconds: 500), 
        (){
          Navigator.pushAndRemoveUntil(
            context, 
            HomeScreen.goTo(), 
            (route) => false
          );
        }
      );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    navigateTo(context: context);
    return const Scaffold();
  }
}