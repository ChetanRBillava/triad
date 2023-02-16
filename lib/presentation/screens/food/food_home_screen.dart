import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:assignment/presentation/router/app_router.dart';
import 'package:assignment/presentation/utils/custom_button.dart';
import 'package:assignment/presentation/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/food_tile.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({Key? key}) : super(key: key);

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return SafeArea(
            child: Scaffold(
              backgroundColor: (themeState as AppThemeSet).themeClass.backgroundColor,
              appBar: AppBar(
                backgroundColor: themeState.themeClass.foodAppBarColor,
                leading: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(AppRouter.home);
                  },
                  child: Icon(
                      Icons.home,
                    size: 20.sp,
                  ),
                ),
                title: CustomText(
                  textString: 'Welcome John Doe',
                  textColor: themeState.themeClass.textColor_2,
                  fontWeight: FontWeight.bold,
                ),
                centerTitle: true,
                actions: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed(AppRouter.foodCart);
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      size: 20.sp,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 2.w),
                    child: CustomText(
                      textString: '1',
                      textColor: themeState.themeClass.textColor_2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 100.h,
                      child: GridView.builder(
                        itemCount:12,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: (46.w / (32.h+12.sp)),
                        ),
                        itemBuilder: (context,index,) {
                          return const FoodTile();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}