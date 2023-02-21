import 'dart:async';

import 'package:assignment/core/constants/images.dart';
import 'package:assignment/core/constants/strings.dart';
import 'package:assignment/presentation/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../logic/cubit/app_theme_cubit.dart';
import '../router/app_router.dart';
import '../utils/custom_print.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver{

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushNamed(AppRouter.home);
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  Future<void> didChangePlatformBrightness() async {
    // TODO: implement didChangePlatformBrightness
    customPrint.myCustomPrint('Updating brightness');
    final Brightness currentBrightness = SchedulerBinding.instance.window.platformBrightness;

    customPrint.myCustomPrint(currentBrightness);
    if (currentBrightness == Brightness.light) {
      BlocProvider.of<AppThemeCubit>(context).setLightTheme();
    }
    else {
      BlocProvider.of<AppThemeCubit>(context).setDarkTheme();
    }
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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
                  const CustomText(textString: 'App version: ${Strings.appVersion}'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      textString: 'Switch your device\'s theme to dark theme to experience the dark theme layout',
                      textAlign: TextAlign.center, textFontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            )
        );
      },
    );
  }
}
