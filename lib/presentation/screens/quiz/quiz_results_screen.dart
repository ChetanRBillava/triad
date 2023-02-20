import 'package:assignment/logic/bloc/quiz_bloc.dart';
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
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, quizState) {
        return BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, themeState) {
            return SafeArea(
                child: Scaffold(
                  backgroundColor: (themeState as AppThemeSet).themeClass.quizBackgroundColor,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: (themeState as AppThemeSet).themeClass.quizBackgroundColor,
                    leading: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed(AppRouter.home);
                      },
                      child: Icon(
                        Icons.home,
                        size: 30.sp,
                        color: themeState.themeClass.textColor_2,
                      ),
                    ),
                  ),
                  body: ListView(
                    children: [
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
                              textString: 'Your score is ${(quizState as QuizResult).score}/3',
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
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.h, bottom: 15.h, left: 3.w, right: 3.w),
                              child: CustomText(
                                textString: quizState.score==3?'Congratulations ${quizState.name.toUpperCase()}!!!\nIt is a perfect score!!!':
                                quizState.score==2?'Congratulations ${quizState.name} you cleared the quiz!!!':
                                quizState.score==1?'OOPS ${quizState.name}!!!\nBetter luck next time!!!':
                                'Oh no!!! Don\'t worry ${quizState.name}\nyou can always try again!!!',
                                fontWeight: FontWeight.bold,
                                textColor: (themeState).themeClass.textColor_2,
                                textAlign: TextAlign.center,
                              ),
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
                      ListView.builder(
                        itemCount: quizState.leaderboard.length>5?5:quizState.leaderboard.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: CustomText(
                                        textString: (i+1).toString(),
                                        textFontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        textColor: (themeState).themeClass.textColor_2,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left:5.w),
                                      child: CustomText(
                                        textString: quizState.leaderboard[i]['name'],
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
                                    textString: '${quizState.leaderboard[i]['score']}/3',
                                    textFontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    textColor: (themeState).themeClass.textColor_2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
            );
          },
        );
      },
    );
  }
}
