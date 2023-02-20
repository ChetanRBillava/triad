import 'dart:async';

import 'package:assignment/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../logic/cubit/app_theme_cubit.dart';
import '../../utils/custom_text.dart';

class FoodOrderSuccessScreen extends StatefulWidget {
  const FoodOrderSuccessScreen({Key? key}) : super(key: key);

  @override
  State<FoodOrderSuccessScreen> createState() => _FoodOrderSuccessScreenState();
}

class _FoodOrderSuccessScreenState extends State<FoodOrderSuccessScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), (){
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.of(context).pushNamed(AppRouter.foodOrderDetails);
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
              backgroundColor: themeState.themeClass.foodAppBarColor,
              automaticallyImplyLeading: true,
              title: CustomText(
                textString: 'Payment status'.toUpperCase(),
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
                    Lottie.asset('assets/order_complete.json'),
                  ],
                ),
                CustomText(
                  textString: 'CONGRATULATIONS!!!'.toUpperCase(),
                  fontWeight: FontWeight.bold,
                ),
                const CustomText(
                  textString: 'Your order has been placed successfully!',
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
