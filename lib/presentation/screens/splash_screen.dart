import 'dart:async';

import 'package:assignment/core/constants/images.dart';
import 'package:assignment/core/constants/strings.dart';
import 'package:assignment/presentation/screens/home_screen.dart';
import 'package:assignment/presentation/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/app_theme_cubit.dart';
import '../router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushNamed(AppRouter.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return SafeArea(
            child: Scaffold(
              backgroundColor: (themeState as AppThemeSet).themeClass.backgroundColor,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logoGIF),
                  const CustomText(textString: 'App version: ${Strings.appVersion}')
                ],
              ),
            )
        );
      },
    );
  }
}
