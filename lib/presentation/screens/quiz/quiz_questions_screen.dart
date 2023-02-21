import 'package:assignment/presentation/utils/custom_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/quizQuestions.dart';
import '../../../logic/bloc/quiz_bloc.dart';
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
  int page = 1;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, quizState) {
        // TODO: implement listener
      },
      builder: (context, quizState) {
        return BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, themeState) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: (themeState as AppThemeSet).themeClass.quizBackgroundColor,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              color: themeState.themeClass.white,
                            ),
                          ),
                        )
                      ],
                    ),

                    ///Q1
                    page == 1 ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                textString: 'Question 1'.toUpperCase(),
                                textFontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                textColor: themeState.themeClass.white,
                              ),
                            ],
                          ),

                          ///question
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                textString: (quizState as QuizStarted).firstQuestion['question'],
                                textFontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                textColor: themeState.themeClass.white,
                              ),
                            ],
                          ),

                          ///url
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                quizState.firstQuestion['url'],
                                width: 80.w,
                                fit: BoxFit.fitWidth,
                              )
                            ],
                          ),

                          ///options
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                buttonColor: quizState.fqANS=='a'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.firstQuestion['a'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 1, selOption: 'a'));
                                },
                              ),
                              CustomButton(
                                buttonColor: quizState.fqANS=='b'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.firstQuestion['b'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 1, selOption: 'b'));
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                buttonColor: quizState.fqANS=='c'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.firstQuestion['c'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 1, selOption: 'c'));
                                },
                              ),
                              CustomButton(
                                buttonColor: quizState.fqANS=='d'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.firstQuestion['d'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 1, selOption: 'd'));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ):

                    ///Q2
                    page == 2 ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                textString: 'Question 2'.toUpperCase(),
                                textFontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                textColor: themeState.themeClass.white,
                              ),
                            ],
                          ),

                          ///question
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                textString: (quizState as QuizStarted).secondQuestion['question'],
                                textFontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                textColor: themeState.themeClass.white,
                              ),
                            ],
                          ),

                          ///options
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                buttonColor: quizState.sqANS=='a'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.secondQuestion['a'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 2, selOption: 'a'));
                                },
                              ),
                              CustomButton(
                                buttonColor: quizState.sqANS=='b'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.secondQuestion['b'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 2, selOption: 'b'));
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                buttonColor: quizState.sqANS=='c'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.secondQuestion['c'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 2, selOption: 'c'));
                                },
                              ),
                              CustomButton(
                                buttonColor: quizState.sqANS=='d'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.secondQuestion['d'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 2, selOption: 'd'));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ):

                    ///Q3
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                textString: 'Question 3'.toUpperCase(),
                                textFontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                textColor: themeState.themeClass.white,
                              ),
                            ],
                          ),

                          ///question
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                textString: (quizState as QuizStarted).thirdQuestion['question'],
                                textFontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                textColor: themeState.themeClass.white,
                              ),
                            ],
                          ),

                          ///url
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                quizState.thirdQuestion['url'],
                                width: 80.w,
                                fit: BoxFit.fitWidth,
                              )
                            ],
                          ),

                          ///options
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                buttonColor: quizState.tqANS=='a'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.thirdQuestion['a'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 3, selOption: 'a'));
                                },
                              ),
                              CustomButton(
                                buttonColor: quizState.tqANS=='b'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.thirdQuestion['b'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 3, selOption: 'b'));
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                buttonColor: quizState.tqANS=='c'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.thirdQuestion['c'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 3, selOption: 'c'));
                                },
                              ),
                              CustomButton(
                                buttonColor: quizState.tqANS=='d'?themeState.themeClass.warningColor:themeState.themeClass.buttonBackgroundColor2,
                                buttonText: quizState.thirdQuestion['d'],
                                buttonSize: 40.w,
                                borderRadius: 15,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  BlocProvider.of<QuizBloc>(context).add(const QuizSelectOption(qNum: 3, selOption: 'd'));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),


                    Row(
                      mainAxisAlignment: page == 1?MainAxisAlignment.end:MainAxisAlignment.spaceBetween,
                      children: [
                        page == 1?const SizedBox.shrink():Padding(
                          padding: EdgeInsets.only(left: 5.w, bottom: 5.w),
                          child: CustomButton(
                            buttonColor: themeState.themeClass.buttonBackgroundColor2,
                            iconData: Icons.arrow_back_ios,
                            iconColor: themeState.themeClass.textColor_1,
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
                          padding: EdgeInsets.only(right: 5.w, bottom: 5.w),
                          child: CustomButton(
                            buttonColor: themeState.themeClass.buttonBackgroundColor2,
                            iconData: Icons.arrow_forward_ios,
                            iconColor: themeState.themeClass.textColor_1,
                            borderRadius: 15,
                            fontWeight: FontWeight.bold,
                            onTapEvent: (){
                              setState(() {
                                page += 1;
                              });
                            },
                          ),
                        ):Padding(
                          padding: EdgeInsets.only(right: 5.w, bottom: 5.w),
                          child: CustomButton(
                            buttonColor: themeState.themeClass.buttonBackgroundColor2,
                            buttonText: 'DONE',
                            buttonTextColor: themeState.themeClass.textColor_1,
                            borderRadius: 15,
                            fontWeight: FontWeight.bold,
                            onTapEvent: (){
                              BlocProvider.of<QuizBloc>(context).add(QuizDone(context: context));
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
      },
    );
  }
}
