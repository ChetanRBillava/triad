import 'dart:async';

import 'package:assignment/core/constants/images.dart';
import 'package:assignment/core/constants/strings.dart';
import 'package:assignment/presentation/screens/home_screen.dart';
import 'package:assignment/presentation/utils/custom_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 6), (){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomeScreen(title: 'Flutter Demo Home Page'),)
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.logoGIF),
              const CustomText(textString: 'App version: ${Strings.appVersion}')
            ],
          ),
        )
    );
  }
}
