import 'package:flutter/material.dart';
import 'package:sihaty_app/core/constants/assets_images.dart';
import 'package:sihaty_app/core/functions/routing.dart';
import 'package:sihaty_app/features/splash/presentation/view/intro_view.dart';
 

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      navigatorToReplacement(context, const IntroView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(height: 300, width: 300, AssetImages.appIcon),
      ),
    );
  }
}