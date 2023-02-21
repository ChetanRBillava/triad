import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:assignment/presentation/router/app_router.dart';
import 'package:assignment/presentation/utils/custom_button.dart';
import 'package:assignment/presentation/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/food_list.dart';
import '../../../logic/bloc/food_bloc.dart';
import '../../widgets/food_tile.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({Key? key}) : super(key: key);

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, foodState) {
        return BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, themeState) {
            return SafeArea(
                child: Scaffold(
                  backgroundColor: (themeState as AppThemeSet).themeClass.backgroundColor,
                  appBar: AppBar(
                    backgroundColor: themeState.themeClass.foodAppBarColor,
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRouter.home);
                      },
                      child: Icon(
                        Icons.home,
                        size: 20.sp,
                        color: themeState.themeClass.white,
                      ),
                    ),
                    title: CustomText(
                      textString: 'Welcome ${context.read<FoodBloc>().state.props[0].toString()}',
                      textColor: themeState.themeClass.white,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    centerTitle: true,
                    actions: [
                      GestureDetector(
                        onTap: () {
                          if(foodState is !FoodDetails){
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('No product added yet'),
                                )
                            );
                          }
                          else{
                            Navigator.of(context).pushNamed(AppRouter.foodCart);
                          }
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          size: 20.sp,
                          color: themeState.themeClass.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: CustomText(
                          textString: context.read<FoodBloc>().state.props[6].toString(),
                          textColor: themeState.themeClass.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: foodList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: (46.w / (32.h + 12.sp)),
                          ),
                          itemBuilder: (context, index,) {
                            return FoodTile(index: index, homeScreen: true,);
                          },
                        ),
                      ),
                    ],
                  ),
                )
            );
          },
        );
      },
    );
  }
}