import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:assignment/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/images.dart';
import '../utils/custom_text.dart';

class BikeTile extends StatelessWidget {
  const BikeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(AppRouter.bikeDetails);
          },
          child: SizedBox(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:12.h, left: 2.w, right: 2.w),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      //side: BorderSide(color: (themeState as AppThemeSet).themeClass.foodBackgroundColor, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 15,
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 3.w, bottom: 2.h, top: 7.h),
                                child: CustomText(
                                  textString: 'RE Classic 350',
                                  fontFamily: 'faster one',
                                  textFontSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 2.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.local_gas_station, size: 20.sp,),
                                    CustomText(
                                      textString: '40 KM/L',
                                      textFontSize: 16.sp,
                                    ),
                                  ],
                                ),
                                Container(height: 20.sp, width: 1.w, color: (themeState as AppThemeSet).themeClass.textColor_1,),
                                Row(
                                  children: [
                                    Icon(Icons.account_balance_wallet, size: 20.sp,),
                                    CustomText(
                                      textString: '₹1399/D',
                                      textFontSize: 16.sp,
                                    ),
                                  ],
                                ),
                                Container(height: 20.sp, width: 1.w, color: themeState.themeClass.textColor_1,),
                                Row(
                                  children: [
                                    Icon(Icons.stars, size: 20.sp,),
                                    CustomText(
                                      textString: '4.5',
                                      textFontSize: 16.sp,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    AppImages.re,
                    height: 20.h,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}