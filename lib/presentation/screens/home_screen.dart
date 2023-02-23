import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:assignment/logic/cubit/home_cubit.dart';
import 'package:assignment/logic/cubit/internet_cubit.dart';
import 'package:assignment/presentation/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../router/app_router.dart';
import '../utils/custom_print.dart';
import '../widgets/dialogs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  late AnimationController bikeAnimationController, quizAnimationController, foodAnimationController;
  late Animation<double> bikeSizeAnimation, quizSizeAnimation, foodSizeAnimation;
  late final Animation<double> bikeCurve, quizCurve, foodCurve;

  @override
  void initState() {

    BlocProvider.of<InternetCubit>(context).firstCheck();
    bikeAnimationController = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this
    );
    bikeCurve = CurvedAnimation(parent: bikeAnimationController, curve: Curves.fastOutSlowIn);
    bikeSizeAnimation = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
              tween: Tween<double>(begin: 4.w, end: 12.w),
              weight: 50
          ),
        ]
    ).animate(bikeCurve);
    bikeAnimationController.forward();


    quizAnimationController = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this
    );
    quizCurve = CurvedAnimation(parent: quizAnimationController, curve: Curves.fastOutSlowIn);
    quizSizeAnimation = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
              tween: Tween<double>(begin: 4.w, end: 12.w),
              weight: 50
          ),
        ]
    ).animate(quizCurve);

    foodAnimationController = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this
    );
    foodCurve = CurvedAnimation(parent: foodAnimationController, curve: Curves.fastOutSlowIn);
    foodSizeAnimation = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
              tween: Tween<double>(begin: 4.w, end: 12.w),
              weight: 50
          ),
        ]
    ).animate(foodCurve);
    super.initState();
  }

  @override
  void dispose() {
    bikeAnimationController.dispose();
    quizAnimationController.dispose();
    foodAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, internetState) {
        if(internetState is InternetDisconnected){
          noInternetDialog(context);
        }
      },
      builder: (context, internetState) {
        return BlocBuilder<InternetCubit, InternetState>(
          builder: (context, internetState) {
            return BlocBuilder<AppThemeCubit, AppThemeState>(
              builder: (context, themeState) {
                return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, homeState) {
                    return SafeArea(
                      child: Scaffold(
                          backgroundColor: (themeState as AppThemeSet).themeClass.backgroundColor,
                          body: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 60.h,
                                    width: 80.w,
                                    child: Stack(
                                      children: [
                                        AnimatedAlign(
                                          alignment: homeState.position==0?Alignment.topCenter:
                                          homeState.position==1?Alignment.bottomLeft:Alignment.bottomRight,
                                          curve: Curves.fastOutSlowIn,
                                          duration: const Duration(seconds: 1),
                                          child: AnimatedBuilder(
                                            animation: bikeAnimationController,
                                            builder: (BuildContext context, Widget? child) {
                                              return TweenAnimationBuilder(
                                                tween: Tween<double>(begin: 0, end: 1),
                                                duration: const Duration(seconds: 1),
                                                curve: Curves.fastOutSlowIn,
                                                builder: (BuildContext context, double value, Widget? child) {
                                                  return GestureDetector(
                                                    onTap: (){
                                                      bikeAnimationController.forward();
                                                      foodAnimationController.reverse();
                                                      quizAnimationController.reverse();
                                                      BlocProvider.of<HomeCubit>(context).resetState();
                                                      Navigator.of(context).pushNamed(AppRouter.bikeLogin);
                                                    },
                                                    child: AnimatedContainer(
                                                      duration: const Duration(seconds: 0),
                                                      width: bikeSizeAnimation.value*5,
                                                      height: bikeSizeAnimation.value*5,
                                                      decoration: BoxDecoration(
                                                        color: themeState.themeClass.white,
                                                        borderRadius: BorderRadius.all(Radius.circular(5.w)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: (themeState).themeClass.splashBikeTileShadow,
                                                            offset: const Offset(0, 0),
                                                            blurRadius: bikeSizeAnimation.value,
                                                            spreadRadius: bikeSizeAnimation.value*0.33,
                                                          )
                                                        ],
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Icon(
                                                            Icons.directions_bike,
                                                            size: bikeSizeAnimation.value*3,
                                                          ),
                                                          CustomText(
                                                            textString:'BIKE',
                                                            textFontSize: bikeSizeAnimation.value,
                                                            textColor: themeState.themeClass.black,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        AnimatedAlign(
                                          alignment: homeState.position==1?Alignment.topCenter:
                                          homeState.position==2?Alignment.bottomLeft:Alignment.bottomRight,
                                          curve: Curves.fastOutSlowIn,
                                          duration: const Duration(seconds: 1),
                                          child: AnimatedBuilder(
                                            animation: quizAnimationController,
                                            builder: (BuildContext context, Widget? child) {
                                              return TweenAnimationBuilder(
                                                tween: Tween<double>(begin: 0, end: 1),
                                                duration: const Duration(seconds: 1),
                                                curve: Curves.fastOutSlowIn,
                                                builder: (BuildContext context, double value, Widget? child) {
                                                  return GestureDetector(
                                                    onTap: (){
                                                      bikeAnimationController.forward();
                                                      foodAnimationController.reverse();
                                                      quizAnimationController.reverse();
                                                      BlocProvider.of<HomeCubit>(context).resetState();
                                                      Navigator.of(context).pushNamed(AppRouter.quizHome);
                                                    },
                                                    child: AnimatedContainer(
                                                      duration: const Duration(seconds: 0),
                                                      width: quizSizeAnimation.value*5,
                                                      height: quizSizeAnimation.value*5,
                                                      decoration: BoxDecoration(
                                                        color: themeState.themeClass.white,
                                                        borderRadius: BorderRadius.all(Radius.circular(5.w)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: (themeState).themeClass.splashQuizTileShadow,
                                                            offset: const Offset(0, 0),
                                                            blurRadius: quizSizeAnimation.value,
                                                            spreadRadius: quizSizeAnimation.value*0.33,
                                                          )
                                                        ],
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Icon(
                                                            Icons.quiz,
                                                            size: quizSizeAnimation.value*3,
                                                          ),
                                                          CustomText(
                                                            textString:'QUIZ',
                                                            textFontSize: quizSizeAnimation.value,
                                                            textColor: themeState.themeClass.black,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        AnimatedAlign(
                                          alignment: homeState.position==2?Alignment.topCenter:
                                          homeState.position==0?Alignment.bottomLeft:Alignment.bottomRight,
                                          curve: Curves.fastOutSlowIn,
                                          duration: const Duration(seconds: 1),
                                          child: AnimatedBuilder(
                                            animation: foodAnimationController,
                                            builder: (BuildContext context, Widget? child) {
                                              return TweenAnimationBuilder(
                                                tween: Tween<double>(begin: 0, end: 1),
                                                duration: const Duration(seconds: 1),
                                                curve: Curves.fastOutSlowIn,
                                                builder: (BuildContext context, double value, Widget? child) {
                                                  return GestureDetector(
                                                    onTap: (){
                                                      bikeAnimationController.forward();
                                                      foodAnimationController.reverse();
                                                      quizAnimationController.reverse();
                                                      BlocProvider.of<HomeCubit>(context).resetState();
                                                      Navigator.of(context).pushNamed(AppRouter.foodLogin);
                                                    },
                                                    child: AnimatedContainer(
                                                      duration: const Duration(seconds: 0),
                                                      width: foodSizeAnimation.value*5.2,
                                                      height: foodSizeAnimation.value*5.2,
                                                      decoration: BoxDecoration(
                                                        color: themeState.themeClass.white,
                                                        borderRadius: BorderRadius.all(Radius.circular(5.w)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: (themeState).themeClass.splashFoodTileShadow,
                                                            offset: const Offset(0, 0),
                                                            blurRadius: foodSizeAnimation.value,
                                                            spreadRadius: foodSizeAnimation.value*0.33,
                                                          )
                                                        ],
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Icon(
                                                            Icons.restaurant,
                                                            size: foodSizeAnimation.value*3,
                                                          ),
                                                          CustomText(
                                                            textString:'FOOD',
                                                            textFontSize: foodSizeAnimation.value,
                                                            textColor: themeState.themeClass.black,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        if(homeState.position==0){
                                          bikeAnimationController.reverse();
                                          foodAnimationController.forward();
                                        }
                                        else if(homeState.position==2){
                                          foodAnimationController.reverse();
                                          quizAnimationController.forward();
                                        }
                                        else{
                                          quizAnimationController.reverse();
                                          bikeAnimationController.forward();
                                        }
                                        BlocProvider.of<HomeCubit>(context).changePosition(false);
                                      },
                                      child: Container(
                                        width: 10.w,
                                        height: 10.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: themeState.themeClass.white,
                                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 7.w,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        if(homeState.position==0){
                                          bikeAnimationController.reverse();
                                          quizAnimationController.forward();
                                        }
                                        else if(homeState.position==1){
                                          quizAnimationController.reverse();
                                          foodAnimationController.forward();
                                        }
                                        else{
                                          foodAnimationController.reverse();
                                          bikeAnimationController.forward();
                                        }

                                        BlocProvider.of<HomeCubit>(context).changePosition(true);
                                      },
                                      child: Container(
                                        width: 10.w,
                                        height: 10.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: themeState.themeClass.white,
                                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 7.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
