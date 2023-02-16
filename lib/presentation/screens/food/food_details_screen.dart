import 'package:assignment/presentation/utils/custom_button.dart';
import 'package:assignment/presentation/utils/custom_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/app_theme_cubit.dart';
import '../../router/app_router.dart';
import '../../utils/custom_text.dart';
import '../../widgets/food_tile.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
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
                textString: 'Product details'.toUpperCase(),
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
                  ///main
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 45.w,
                        child: Padding(
                          padding: EdgeInsets.all(1.w),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: themeState.themeClass.foodTextColor, width: 2),
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  child: Image.network(
                                    'https://live.staticflickr.com/65535/52692322548_b09b9e12cc_m.jpg',
                                    height: 25.h,
                                    width: 44.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.5.w, right: 2.5.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 50.w,
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
                            SizedBox(
                              width: 50.w,
                              child: CustomText(
                                textString: 'Garden salads use a base of leafy greens such as lettuce, arugula/rocket, kale or spinach; they are common enough that the word salad alone often refers specifically to garden salads. Other types include bean salad, tuna salad, bread salad (e.g. fattoush, panzanella), vegetable salads without leafy greens (e.g. Greek salad, potato salad, coleslaw), sōmen salad (a noodle-based salad).',
                                textFontSize: 8.sp,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ///more images
                  Padding(
                    padding: EdgeInsets.only(top: 2.h, left: 3.w, right: 3.w),
                    child: SizedBox(
                      height: 12.w,
                      child: ListView.builder(
                        itemCount: 8,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: themeState.themeClass.foodTextColor, width: 1),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                child: Image.network(
                                  'https://live.staticflickr.com/65535/52692322548_b09b9e12cc_m.jpg',
                                  height: 12.w,
                                  width: 12.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  ///button
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          buttonColor: themeState.themeClass.foodButtonColor, buttonSize: 90.w,
                          buttonText: 'ADD', buttonTextColor: themeState.themeClass.textColor_2,
                          borderRadius: 3.w, fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),

                  ///similar products
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3.w, top: 3.h, bottom: 1.h),
                        child: CustomText(
                          textString: 'Similar Products',
                          textFontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h, left: 3.w, right: 3.w),
                    child: SizedBox(
                      height: (34.h+15.sp),
                      child: ListView.builder(
                        itemCount: 8,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 3.w),
                            child: const FoodTile(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
