import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:assignment/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../utils/custom_button.dart';
import '../utils/custom_text.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(AppRouter.foodDetails);
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
                        'https://live.staticflickr.com/65535/52692322548_b09b9e12cc_m.jpg',
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
                                        textString: '₹199',
                                        textColor: themeState.themeClass.textColor_2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        textString: 'Salad',
                                        textColor: themeState.themeClass.textColor_2,
                                        fontWeight: FontWeight.bold,
                                        textFontSize: 14.sp,
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: CustomText(
                                      textString: 'Salad with the combination of green vegies, corns and some other essential nutrients',
                                      textColor: themeState.themeClass.textColor_2,
                                      fontWeight: FontWeight.bold,
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
                      padding: EdgeInsets.all(1.w),
                      child: Container(
                        width: 5.w, height: 5.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: themeState.themeClass.vegColor
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}