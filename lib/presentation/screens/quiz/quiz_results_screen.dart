import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../router/app_router.dart';
import '../../utils/custom_text.dart';

class QuizResultsScreen extends StatefulWidget {
  const QuizResultsScreen({Key? key}) : super(key: key);

  @override
  State<QuizResultsScreen> createState() => _QuizResultsScreenState();
}

class _QuizResultsScreenState extends State<QuizResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return SafeArea(
            child: Scaffold(
              backgroundColor: (themeState as AppThemeSet).themeClass.quizBackgroundColor,
              body: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(AppRouter.home);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5.w),
                          child: Icon(
                            Icons.home,
                            size: 30.sp,
                            color: themeState.themeClass.textColor_2,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: CustomText(
                          textString: 'Result'.toUpperCase(),
                          textFontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (themeState).themeClass.textColor_2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: CustomText(
                          textString: 'Your score is 3/3',
                          textFontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (themeState).themeClass.textColor_2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.h, bottom: 15.h),
                        child: CustomText(
                          textString: 'Congratulations on such a performance',
                          fontWeight: FontWeight.bold,
                          textColor: (themeState).themeClass.textColor_2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.w),
                        child: CustomText(
                          textString: 'Leaderboard',
                          textFontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (themeState).themeClass.textColor_2,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: CustomText(
                                textString: '1',
                                textFontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                textColor: (themeState).themeClass.textColor_2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:5.w),
                              child: CustomText(
                                textString: 'John Doe',
                                textFontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                textColor: (themeState).themeClass.textColor_2,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: CustomText(
                            textString: '3/3',
                            textFontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            textColor: (themeState).themeClass.textColor_2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: CustomText(
                                textString: '2',
                                textFontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                textColor: (themeState).themeClass.textColor_2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:5.w),
                              child: CustomText(
                                textString: 'John Doe',
                                textFontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                textColor: (themeState).themeClass.textColor_2,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: CustomText(
                            textString: '3/3',
                            textFontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            textColor: (themeState).themeClass.textColor_2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: CustomText(
                                textString: '3',
                                textFontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                textColor: (themeState).themeClass.textColor_2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:5.w),
                              child: CustomText(
                                textString: 'John Doe',
                                textFontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                textColor: (themeState).themeClass.textColor_2,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: CustomText(
                            textString: '3/3',
                            textFontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            textColor: (themeState).themeClass.textColor_2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        );
      },
    );
  }
}
