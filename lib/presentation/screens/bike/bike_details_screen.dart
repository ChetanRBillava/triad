import 'package:assignment/presentation/router/app_router.dart';
import 'package:assignment/presentation/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/images.dart';
import '../../../logic/bloc/bike_bloc.dart';
import '../../../logic/cubit/app_theme_cubit.dart';
import '../../utils/custom_text.dart';

class BikeDetailsScreen extends StatefulWidget {
  const BikeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BikeDetailsScreen> createState() => _BikeDetailsScreenState();
}

class _BikeDetailsScreenState extends State<BikeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BikeBloc, BikeState>(
  builder: (context, bikeState) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: (themeState as AppThemeSet).themeClass.bikeBackgroundColor,
            appBar: AppBar(
              backgroundColor: themeState.themeClass.bikeAppBarColor,
              automaticallyImplyLeading: true,
              title: CustomText(
                textString: 'Bike details',
                textColor: themeState.themeClass.white,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 3.w, top: 2.h),
                          child: CustomText(
                            textString: (bikeState as BikeDetails).bikeDetails['Name'],
                            fontFamily: 'faster one',
                            textFontSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 3.w, top: 1.h),
                          child: CustomText(
                            textString: bikeState.bikeDetails['Brand'],
                            textFontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ///image
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///colors
                        SizedBox(
                          height: 55.w,
                          child: Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 5.w,
                                  width: 5.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF242A3A),
                                    borderRadius: BorderRadius.all(Radius.circular(1.w))
                                  ),
                                ),
                                Container(
                                  height: 5.w,
                                  width: 5.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF6A1412),
                                    borderRadius: BorderRadius.all(Radius.circular(1.w))
                                  ),
                                ),
                                Container(
                                  height: 5.w,
                                  width: 5.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD4E4E3),
                                    borderRadius: BorderRadius.all(Radius.circular(1.w))
                                  ),
                                ),
                                Container(
                                  height: 5.w,
                                  width: 5.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF80816D),
                                    border: Border.all(color: Color(0xFF216709)),
                                    borderRadius: BorderRadius.all(Radius.circular(1.w))
                                  ),
                                ),
                                Container(
                                  height: 5.w,
                                  width: 5.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD6B9AB),
                                    borderRadius: BorderRadius.all(Radius.circular(1.w))
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Image.asset(
                          bikeState.mainIMG,
                          width: 70.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.w,
                      child: ListView.builder(
                        itemCount: bikeState.bikeDetails['images'].length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: (){
                              BlocProvider.of<BikeBloc>(context).add(BikeToggleMainURL(newMainURL: bikeState.bikeDetails['images'][i]));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 4.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: themeState.themeClass.bikeBorderColor),
                                    borderRadius: BorderRadius.all(Radius.circular(3.w))
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.w),
                                  child: Image.asset(
                                    bikeState.bikeDetails['images'][i],
                                    width: 15.w,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: themeState.themeClass.bikeBorderColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5.w), topRight: Radius.circular(5.w))
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Container(
                          width: 40.w,
                          height: 0.5.h,
                          color: themeState.themeClass.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              textString: 'Mileage: ${bikeState.bikeDetails['Mileage']}',
                              textColor: themeState.themeClass.white,
                              fontWeight: FontWeight.bold,
                              textFontSize: 14.sp,
                            ),
                            Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: themeState.themeClass.foodTextColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: themeState.themeClass.foodTextColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: themeState.themeClass.foodTextColor,
                                  ),
                                  Icon(
                                    Icons.star_half,
                                    color: themeState.themeClass.foodTextColor,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: themeState.themeClass.foodTextColor,
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: CustomText(
                          textString: bikeState.bikeDetails['Description'],
                          textColor: themeState.themeClass.white,
                          textFontSize: 10.sp,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.w),
                            child: CustomText(
                              textString: '₹${bikeState.bikeDetails['Amount']}/D',
                              textColor: themeState.themeClass.white,
                              fontWeight: FontWeight.bold,
                              textFontSize: 18.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.w),
                            child: CustomButton(
                                buttonColor: themeState.themeClass.bikeButtonBackgroundColor,
                              buttonSize: 40.w,
                              buttonText: 'RENT NOW',
                              fontWeight: FontWeight.bold,
                              borderRadius: 2.w,
                              onTapEvent: (){
                                  Navigator.of(context).pushNamed(AppRouter.bikeCheckout);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  },
);
  }
}
