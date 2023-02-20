import 'package:assignment/logic/bloc/bike_bloc.dart';
import 'package:assignment/logic/bloc/food_bloc.dart';
import 'package:assignment/logic/bloc/quiz_bloc.dart';
import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:assignment/logic/cubit/home_cubit.dart';
import 'package:assignment/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/constants/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  bool setColor = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => QuizBloc(),
        ),
        BlocProvider(
          create: (context) => BikeBloc(),
        ),
        BlocProvider(
          create: (context) => FoodBloc(),
        ),
      ],
      child: Sizer(builder: (context, constraints, orientation) {
        if(!setColor){
          BlocProvider.of<AppThemeCubit>(context).setLightTheme();
          setColor = true;
        }
        return const MaterialApp(
          title: Strings.appTitle,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.splash,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      }),
    );
  }
}