import 'dart:async';

import 'package:assignment/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/app_theme_cubit.dart';
import '../../router/app_router.dart';
import '../../utils/custom_text.dart';

class BikeOrderSuccessScreen extends StatefulWidget {
  const BikeOrderSuccessScreen({Key? key}) : super(key: key);

  @override
  State<BikeOrderSuccessScreen> createState() => _BikeOrderSuccessScreenState();
}

class _BikeOrderSuccessScreenState extends State<BikeOrderSuccessScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), (){
      Navigator.of(context).pushNamed(AppRouter.bikeHome);
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
            appBar: AppBar(
              backgroundColor: themeState.themeClass.bikeAppBarColor,
              automaticallyImplyLeading: true,
              title: CustomText(
                textString: 'Order complete'.toUpperCase(),
                textColor: themeState.themeClass.textColor_2,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.bike, width: 100.w, fit: BoxFit.fitWidth,),
                  ],
                ),
                SizedBox(height: 3.h),
                CustomText(
                  textString: 'CONGRATULATIONS!!!'.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  textFontSize: 24.sp,
                ),
                CustomText(
                  textString: 'Your rental bike has been successfully booked!!!',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  textFontSize: 10.sp,
                ),
                CustomText(
                  textString: 'Have a safe journey!!!',
                  fontWeight: FontWeight.bold,
                  textFontSize: 10.sp,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}