import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

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
                Padding(
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
                                'https://live.staticflickr.com/65535/52692322548_b09b9e12cc_m.jpg',
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
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.w),
                                    child: CustomText(
                                      textString: 'Salad',
                                      fontWeight: FontWeight.bold,
                                      textFontSize: 16.sp,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.w),
                                    child: CustomText(
                                      textString: '₹199',
                                      fontWeight: FontWeight.bold,
                                      textFontSize: 16.sp,
                                      textColor: themeState.themeClass.foodTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomText(
                              textString: 'VEG',
                              textFontSize: 10.sp,
                              textColor: themeState.themeClass.vegColor,
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
                                              textString: 'QTY: 2',
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
                              child: const CustomText(
                                textString: 'Mr. John Doe',
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                              child: const CustomText(
                                textString: 'Doe villa, Udupi, Karnataka.',
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                              child: const CustomText(
                                textString: 'PINCODE: 576225',
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                              child: const CustomText(
                                textString: 'E-mail: johndoe@example.com',
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                              child: const CustomText(
                                textString: 'Ph No: +91 987 654 3210',
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
                              child: const CustomText(
                                textString: 'Total: ₹398',
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                              child: const CustomText(
                                textString: 'GST: 5% = ₹19.9',
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                              child: const CustomText(
                                textString: 'Delivery: ₹50',
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:2.w, bottom: 1.h),
                              child: CustomText(
                                textString: 'Grand Total: ₹467.90',
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
  }
}
