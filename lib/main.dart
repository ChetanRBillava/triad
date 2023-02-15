import 'package:assignment/presentation/screens/home_screen.dart';
import 'package:assignment/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'core/constants/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, constraints, orientation){
      return const MaterialApp(
        title: Strings.appTitle,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    });
  }
}