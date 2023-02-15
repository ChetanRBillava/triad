import 'package:assignment/presentation/utils/custom_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/quizQuestions.dart';
import '../../../logic/cubit/app_theme_cubit.dart';
import '../../router/app_router.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_text.dart';
import '../../widgets/dialogs.dart';

class QuizQuestionsScreen extends StatefulWidget {
  const QuizQuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuizQuestionsScreen> createState() => _QuizQuestionsScreenState();
}

class _QuizQuestionsScreenState extends State<QuizQuestionsScreen> {
  int fIndex = 0, sIndex = 0, tIndex =0;
  int page = 1;
  String fSelOp = 'z', sSelOp = 'z', tSelOp = 'z';
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

                ///Q1
                page == 1 ? Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            textString: 'Question 1'.toUpperCase(),
                            textFontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            textColor: themeState.themeClass.textColor_2,
                          ),
                        ],
                      ),

                      ///question
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              textString: firstQuestion[fIndex]['question'],
                              textFontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              textColor: themeState.themeClass.textColor_2,
                            ),
                          ],
                        ),
                      ),

                      ///url
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                                firstQuestion[fIndex]['url'],
                                width: 80.w,
                                fit: BoxFit.fitWidth,
                            )
                          ],
                        ),
                      ),

                      ///options
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              buttonColor: fSelOp=='a'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: firstQuestion[fIndex]['a'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  fSelOp = 'a';
                                });
                              },
                            ),
                            CustomButton(
                              buttonColor: fSelOp=='b'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: firstQuestion[fIndex]['b'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  fSelOp = 'b';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              buttonColor: fSelOp=='c'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: firstQuestion[fIndex]['c'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  fSelOp = 'c';
                                });
                              },
                            ),
                            CustomButton(
                              buttonColor: fSelOp=='d'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: firstQuestion[fIndex]['d'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  fSelOp = 'd';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ):

                ///Q2
                page == 2 ? Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            textString: 'Question 2'.toUpperCase(),
                            textFontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            textColor: themeState.themeClass.textColor_2,
                          ),
                        ],
                      ),

                      ///question
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              textString: secondQuestion[sIndex]['question'],
                              textFontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              textColor: themeState.themeClass.textColor_2,
                            ),
                          ],
                        ),
                      ),

                      ///options
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              buttonColor: sSelOp=='a'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: secondQuestion[sIndex]['a'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  sSelOp = 'a';
                                });
                              },
                            ),
                            CustomButton(
                              buttonColor: sSelOp=='b'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: secondQuestion[sIndex]['b'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  sSelOp = 'b';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              buttonColor: sSelOp=='c'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: secondQuestion[sIndex]['c'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  sSelOp = 'c';
                                });
                              },
                            ),
                            CustomButton(
                              buttonColor: sSelOp=='d'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: secondQuestion[sIndex]['d'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  sSelOp = 'd';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ):

                ///Q3
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            textString: 'Question 3'.toUpperCase(),
                            textFontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            textColor: themeState.themeClass.textColor_2,
                          ),
                        ],
                      ),

                      ///question
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              textString: thirdQuestion[tIndex]['question'],
                              textFontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              textColor: themeState.themeClass.textColor_2,
                            ),
                          ],
                        ),
                      ),

                      ///url
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              thirdQuestion[tIndex]['url'],
                              width: 80.w,
                              fit: BoxFit.fitWidth,
                            )
                          ],
                        ),
                      ),

                      ///options
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              buttonColor: tSelOp=='a'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: thirdQuestion[tIndex]['a'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  tSelOp = 'a';
                                });
                              },
                            ),
                            CustomButton(
                              buttonColor: tSelOp=='b'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: thirdQuestion[tIndex]['b'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  tSelOp = 'b';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              buttonColor: tSelOp=='c'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: thirdQuestion[tIndex]['c'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  tSelOp = 'c';
                                });
                              },
                            ),
                            CustomButton(
                              buttonColor: tSelOp=='d'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                              buttonText: thirdQuestion[tIndex]['d'],
                              buttonSize: 40.w,
                              borderRadius: 15,
                              fontWeight: FontWeight.bold,
                              onTapEvent: (){
                                setState(() {
                                  tSelOp = 'd';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                Row(
                  mainAxisAlignment: page == 1?MainAxisAlignment.end:MainAxisAlignment.spaceBetween,
                  children: [
                    page == 1?const SizedBox.shrink():Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: CustomButton(
                        buttonColor: themeState.themeClass.buttonBackgroundColor2,
                        iconData: Icons.arrow_back_ios,
                        borderRadius: 15,
                        fontWeight: FontWeight.bold,
                        onTapEvent: (){
                          setState(() {
                            page -= 1;
                          });
                        },
                      ),
                    ),
                    page != 3? Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: CustomButton(
                        buttonColor: themeState.themeClass.buttonBackgroundColor2,
                        iconData: Icons.arrow_forward_ios,
                        borderRadius: 15,
                        fontWeight: FontWeight.bold,
                        onTapEvent: (){
                          setState(() {
                            page += 1;
                          });
                        },
                      ),
                    ):Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: CustomButton(
                        buttonColor: themeState.themeClass.buttonBackgroundColor2,
                        buttonText: 'DONE',
                        borderRadius: 15,
                        fontWeight: FontWeight.bold,
                        onTapEvent: (){
                          customPrint.myCustomPrint(firstQuestion[fIndex]['question']);
                          customPrint.myCustomPrint(firstQuestion[fIndex][fSelOp]);
                          customPrint.myCustomPrint(firstQuestion[fIndex]['answer']);
                          customPrint.myCustomPrint(firstQuestion[fIndex][fSelOp]==firstQuestion[fIndex]['answer']);
                          quizCompletionDialog(context);
                        },
                      ),
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
