import 'package:assignment/presentation/router/app_router.dart';
import 'package:assignment/presentation/utils/custom_button.dart';
import 'package:assignment/presentation/widgets/separator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/bloc/food_bloc.dart';
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
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, foodState) {
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
                body: (foodState as FoodDetails).cartCount==0?const Center(
                  child: CustomText(
                    textString: 'No food in cart!!',
                    fontWeight: FontWeight.bold,
                  ),
                ):Column(
                  children: [
                    SizedBox(
                      height: 57.h,
                      child: ListView.builder(
                        itemCount: (foodState).cart.length,
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
                                          foodState.cart[i]['images'][0],
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
                                                  textString: foodState.cart[i]['name'],
                                                  fontWeight: FontWeight.bold,
                                                  textFontSize: 16.sp,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 3.w),
                                              child: CustomText(
                                                textString: '₹${foodState.cart[i]['amount']}',
                                                fontWeight: FontWeight.bold,
                                                textFontSize: 16.sp,
                                                textColor: themeState.themeClass.foodTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomText(
                                        textString: foodState.cart[i]['type'].toString().toUpperCase(),
                                        textFontSize: 10.sp,
                                        textColor: foodState.cart[i]['type']=='veg'?themeState.themeClass.vegColor:
                                        foodState.cart[i]['type']=='egg'?themeState.themeClass.eggColor:themeState.themeClass.nonvegColor,
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
                                                        BlocProvider.of<FoodBloc>(context).add(FoodRemoveFromCart(foodDetails: foodState.cart[i], context: context));
                                                      },
                                                      child: Icon(Icons.remove, color: themeState.themeClass.textColor_1,)
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: themeState.themeClass.textColor_1)
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                                      child: CustomText(
                                                        textString: foodState.cart[i]['count'].toString(),
                                                        textFontSize: 14.sp,
                                                        fontWeight: FontWeight.bold,
                                                        textColor: themeState.themeClass.textColor_1,
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){
                                                      BlocProvider.of<FoodBloc>(context).add(FoodAddToCart(foodDetails: foodState.cart[i], context: context));
                                                    },
                                                    child: Icon(
                                                        Icons.add,
                                                      color: themeState.themeClass.textColor_1,
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
                        SeparatorWidget(color: themeState.themeClass.textColor_1,),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(3.w),
                              child: CustomText(
                                textString: 'Total: ₹${foodState.total.toStringAsFixed(2)}',
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(3.w),
                              child: CustomText(
                                textString: 'GST: 5% = ₹${foodState.gst.toStringAsFixed(2)}',
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(3.w),
                              child: CustomText(
                                textString: 'Delivery: ₹${foodState.delivery.toStringAsFixed(2)}',
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(3.w),
                              child: CustomText(
                                textString: 'Grand Total: ₹${foodState.grandTotal.toStringAsFixed(2)}',
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
