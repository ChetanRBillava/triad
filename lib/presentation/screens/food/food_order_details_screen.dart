import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/bloc/food_bloc.dart';
import '../../../logic/cubit/app_theme_cubit.dart';
import '../../utils/custom_text.dart';
import '../../widgets/separator_widget.dart';

class FoodOrderDetailsScreen extends StatefulWidget {
  const FoodOrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FoodOrderDetailsScreen> createState() => _FoodOrderDetailsScreenState();
}

class _FoodOrderDetailsScreenState extends State<FoodOrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, foodState) {
        print((foodState as FoodDetails).orderDetails['products']);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 38.h,
                      child: ListView.builder(
                        itemCount: (foodState as FoodDetails).orderDetails['products'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.all(2.w),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: themeState.themeClass.foodTextColor),
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(4.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: themeState.themeClass.foodTextColor, width: 1),
                                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                                        child: Image.network(
                                          foodState.orderDetails['products'][i]['images'][0],
                                          height: 25.w,
                                          width: 25.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 60.w,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 3.w),
                                              child: SizedBox(
                                                width: 45.w,
                                                child: CustomText(
                                                  textString: foodState.orderDetails['products'][i]['name'],
                                                  fontWeight: FontWeight.bold,
                                                  textFontSize: 16.sp,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 3.w),
                                              child: CustomText(
                                                textString: '₹${foodState.orderDetails['products'][i]['amount']}',
                                                fontWeight: FontWeight.bold,
                                                textFontSize: 16.sp,
                                                textColor: themeState.themeClass.foodTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomText(
                                        textString: foodState.orderDetails['products'][i]['type'].toString().toUpperCase(),
                                        textFontSize: 10.sp,
                                        textColor: foodState.orderDetails['products'][i]['type']=='veg'?themeState.themeClass.vegColor:
                                        foodState.orderDetails['products'][i]['type']=='egg'?themeState.themeClass.eggColor:themeState.themeClass.nonvegColor,
                                      ),

                                      SizedBox(
                                        width: 60.w,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 2.h),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ///ratings
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
                                              ///quantity
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all()
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                                      child: CustomText(
                                                        textString: 'QTY: ${foodState.orderDetails['products'][i]['count']}',
                                                        textFontSize: 14.sp,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),


                    Column(
                      children: [
                        Column(
                          children: [
                            const SeparatorWidget(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(3.w),
                                  child: CustomText(
                                    textString: 'Delivery Address'.toUpperCase(),
                                    fontWeight: FontWeight.bold,
                                    textFontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                                  child: CustomText(
                                    textString: foodState.orderDetails['delivery']['name'],
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                                  child: CustomText(
                                    textString: foodState.orderDetails['delivery']['address'],
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                                  child: CustomText(
                                    textString: 'PINCODE: ${foodState.orderDetails['delivery']['pincode']}',
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                                  child: CustomText(
                                    textString: 'E-mail: ${foodState.orderDetails['delivery']['email']}',
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                                  child: CustomText(
                                    textString: 'Ph No: ${foodState.orderDetails['delivery']['phone']}',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),


                        Column(
                          children: [
                            const SeparatorWidget(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(3.w),
                                  child: CustomText(
                                    textString: 'PRICE BREAKDOWN',
                                    fontWeight: FontWeight.bold,
                                    textFontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                                  child: CustomText(
                                    textString: 'Total: ₹${foodState.orderDetails['pricing']['total'].toStringAsFixed(2)}',
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                                  child: CustomText(
                                    textString: 'GST: 5% = ₹${foodState.orderDetails['pricing']['gst'].toStringAsFixed(2)}',
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                                  child: CustomText(
                                    textString: 'Delivery: ₹${foodState.orderDetails['pricing']['delivery'].toStringAsFixed(2)}',
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                                  child: CustomText(
                                    textString: 'Grand Total: ₹${foodState.orderDetails['pricing']['grandTotal'].toStringAsFixed(2)}',
                                    textFontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
