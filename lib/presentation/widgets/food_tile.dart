import 'package:assignment/logic/bloc/food_bloc.dart';
import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:assignment/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/food_list.dart';
import '../utils/custom_button.dart';
import '../utils/custom_text.dart';

class FoodTile extends StatefulWidget {
  final int index;
  const FoodTile({
    super.key,
    required this.index
  });

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return GestureDetector(
          onTap: (){
            BlocProvider.of<FoodBloc>(context).add(FoodSelected(index: widget.index, context: context));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: (themeState as AppThemeSet).themeClass.foodBackgroundColor, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 15,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      child: Image.network(
                        foodList[widget.index]['images'][0],
                        height: 30.h,
                        width: 46.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.black.withOpacity(0.4),
                            width: 46.w,
                            height: 15.h,
                            child: Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        textString: '₹${foodList[widget.index]['amount']}',
                                        textColor: themeState.themeClass.textColor_2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40.w,
                                        child: CustomText(
                                          textString: foodList[widget.index]['name'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textColor: themeState.themeClass.textColor_2,
                                          fontWeight: FontWeight.bold,
                                          textFontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: CustomText(
                                      textString: foodList[widget.index]['description'],
                                      maxLines: 4,
                                      textColor: themeState.themeClass.textColor_2,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      textFontSize: 8.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.w),
                      child: Container(
                        width: 5.w, height: 5.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: themeState.themeClass.textColor_2),
                            color: foodList[widget.index]['type']=='veg'?themeState.themeClass.vegColor:
                            foodList[widget.index]['type']=='egg'?themeState.themeClass.eggColor:themeState.themeClass.nonvegColor
                        ),
                      ),
                    )
                  ],
                ),
                CustomButton(
                  buttonColor: themeState.themeClass.foodButtonColor, buttonTextColor: themeState.themeClass.textColor_2,
                  buttonSize: 46.w, buttonText: 'ADD', fontWeight: FontWeight.bold,
                  onlyRadius: true,
                  borderRadiusBL: 20, borderRadiusBR: 20,
                  onTapEvent: (){
                    BlocProvider.of<FoodBloc>(context).add(FoodAddToCart(foodDetails: foodList[widget.index], context: context));
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}