import 'package:assignment/presentation/router/app_router.dart';
import 'package:assignment/presentation/utils/custom_button.dart';
import 'package:assignment/presentation/widgets/separator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/app_theme_cubit.dart';
import '../../utils/custom_text.dart';

class FoodCartScreen extends StatefulWidget {
  const FoodCartScreen({Key? key}) : super(key: key);

  @override
  State<FoodCartScreen> createState() => _FoodCartScreenState();
}

class _FoodCartScreenState extends State<FoodCartScreen> {
  int count = 1;
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
                textString: 'Cart'.toUpperCase(),
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
                                        GestureDetector(
                                            onTap: (){
                                              if(count>0) {
                                                setState(() {
                                                count -=1;
                                              });
                                              }
                                            },
                                            child: const Icon(Icons.remove)
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all()
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                            child: CustomText(
                                              textString: count.toString(),
                                              textFontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            if(count<2) {
                                              setState(() {
                                                count +=1;
                                              });
                                            }
                                          },
                                          child: const Icon(
                                              Icons.add
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
                    const SeparatorWidget(),

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3.w),
                          child: const CustomText(
                            textString: 'Total: ₹398',
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3.w),
                          child: const CustomText(
                            textString: 'GST: 5% = ₹19.9',
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3.w),
                          child: const CustomText(
                            textString: 'Delivery: ₹50',
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3.w),
                          child: CustomText(
                            textString: 'Grand Total: ₹467.90',
                            fontWeight: FontWeight.bold,
                            textFontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),

                    CustomButton(
                      buttonColor: themeState.themeClass.foodButtonColor,
                      buttonSize: 90.w,
                      buttonText: 'CHECKOUT',
                      buttonTextColor: themeState.themeClass.textColor_2,
                      fontWeight: FontWeight.bold,
                      borderRadius: 5.w,
                      onTapEvent: (){
                        Navigator.of(context).pushNamed(AppRouter.foodCheckoutAddress);
                      },
                    ),
                    SizedBox(height: 3.h,)
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
