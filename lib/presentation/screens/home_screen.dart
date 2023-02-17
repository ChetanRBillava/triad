import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:assignment/logic/cubit/home_cubit.dart';
import 'package:assignment/presentation/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../router/app_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, homeState) {
            return SafeArea(
              child: Scaffold(
                  body: Stack(
                    children: [
                      ///top tile
                      Positioned(
                        top: 20.h,
                        left: 25.w,
                        right: 25.w,
                        child: GestureDetector(
                          onTap: (){
                            if(homeState.position==1) {
                              Navigator.of(context).pushNamed(AppRouter.quizHome);
                            }
                            else if(homeState.position==2) {
                              Navigator.of(context).pushNamed(AppRouter.foodLogin);
                            }
                            else{
                              Navigator.of(context).pushNamed(AppRouter.bikeLogin);
                            }
                          },
                          child: Container(
                            width: 50.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5.w)),
                              boxShadow: [
                                BoxShadow(
                                  color: homeState.position==0?(themeState as AppThemeSet).themeClass.splashBikeTileShadow:
                                  homeState.position==1?(themeState as AppThemeSet).themeClass.splashQuizTileShadow:
                                  (themeState as AppThemeSet).themeClass.splashFoodTileShadow,
                                  offset: const Offset(0, 0),
                                  blurRadius: 30.0,
                                  spreadRadius: 2.0,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  homeState.position==0?Icons.directions_bike :
                                  homeState.position == 1 ? Icons.quiz : Icons.restaurant,
                                  size: 30.w,
                                ),
                                CustomText(
                                  textString: homeState.position==0?'BIKE':
                                  homeState.position==1?'QUIZ':'FOOD',
                                  textFontSize: 10.w,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      ///left tile
                      Positioned(
                        top: 20.h + 70.w,
                        left: 15.w,
                        child: Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                            boxShadow: [
                              BoxShadow(
                                color: homeState.position==1?(themeState).themeClass.splashBikeTileShadow:
                                homeState.position==2?(themeState).themeClass.splashQuizTileShadow:
                                (themeState).themeClass.splashFoodTileShadow,
                                offset: const Offset(0, 0),
                                blurRadius: 15,
                                spreadRadius: 1.0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                homeState.position==1?Icons.directions_bike :
                                homeState.position == 2 ? Icons.quiz : Icons.restaurant,
                                size: 12.w,
                              ),
                              CustomText(
                                textString: homeState.position==1?'BIKE':
                                homeState.position==2?'QUIZ':'FOOD',
                                textFontSize: 3.w,
                              )
                            ],
                          ),
                        ),
                      ),
                      ///right tile
                      Positioned(
                        top: 20.h + 70.w,
                        right: 15.w,
                        child: Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                            boxShadow: [
                              BoxShadow(
                                color: homeState.position==2?(themeState).themeClass.splashBikeTileShadow:
                                homeState.position==0?(themeState).themeClass.splashQuizTileShadow:
                                (themeState).themeClass.splashFoodTileShadow,
                                offset: const Offset(0, 0),
                                blurRadius: 15,
                                spreadRadius: 1.0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                homeState.position==2?Icons.directions_bike :
                                homeState.position == 0 ? Icons.quiz : Icons.restaurant,
                                size: 12.w,
                              ),
                              CustomText(
                                textString: homeState.position==2?'BIKE':
                                homeState.position==0?'QUIZ':'FOOD',
                                textFontSize: 3.w,
                              )
                            ],
                          ),
                        ),
                      ),
                      ///back
                      Positioned(
                        top: 45.h + 70.w,
                        left: 30.w,
                        child: GestureDetector(
                          onTap: (){
                            BlocProvider.of<HomeCubit>(context).changePosition(false);
                          },
                          child: Container(
                            width: 10.w,
                            height: 10.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 7.w,
                            ),
                          ),
                        ),
                      ),
                      ///next
                      Positioned(
                        top: 45.h + 70.w,
                        right: 30.w,
                        child: GestureDetector(
                          onTap: (){
                            BlocProvider.of<HomeCubit>(context).changePosition(true);
                          },
                          child: Container(
                            width: 10.w,
                            height: 10.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 7.w,
                            ),
                          ),
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
  }
}
