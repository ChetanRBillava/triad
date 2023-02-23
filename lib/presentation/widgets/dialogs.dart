import 'package:assignment/logic/cubit/internet_cubit.dart';
import 'package:assignment/presentation/utils/custom_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/strings.dart';
import '../../logic/bloc/quiz_bloc.dart';
import '../../logic/cubit/app_theme_cubit.dart';
import '../router/app_router.dart';
import '../utils/custom_button.dart';
import '../utils/custom_text.dart';
import '../utils/custom_text_field.dart';

quizCompletionDialog(BuildContext context) {
  TextEditingController ctrl = TextEditingController();
// show the dialog
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, themeState) {
          return Dialog(
              backgroundColor: (themeState as AppThemeSet).themeClass.quizBackgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp)),
            child: SizedBox(
              width: 90.w,
              height: 29.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(5.w),
                          child: CustomText(
                            textString: 'Do you want to submit your answers?',
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            textColor: themeState.themeClass.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.all(4.w),
                    child: CustomTextField(
                      controller: ctrl,
                      hintText: 'Enter your name...',
                      fillColor: themeState.themeClass.formFieldBackgroundColor,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: CustomButton(
                      buttonColor: themeState.themeClass.quizButtonBackgroundColor,
                      buttonText: 'submit'.toUpperCase(),
                      buttonTextColor: themeState.themeClass.white,
                      buttonSize: 90.w,
                      borderRadius: 15,
                      fontWeight: FontWeight.bold,
                      onTapEvent: (){
                        customPrint.myCustomPrint(ctrl.text);
                        BlocProvider.of<QuizBloc>(context).add(QuizSubmit(context: context, name: ctrl.text));
                      },
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

noInternetDialog(BuildContext context) {
// show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return BlocConsumer<InternetCubit, InternetState>(
        listener: (context, internetState) {
          if(internetState is InternetConnected){
            Navigator.pop(context);
          }
        },
        builder: (context, internetState) {
          return BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, themeState) {
              return Dialog(
                backgroundColor: (themeState as AppThemeSet).themeClass.dangerColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp)),
                child: SizedBox(
                  width: 90.w,
                  height: 29.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(5.w),
                              child: CustomText(
                                textString: 'Oops, no internet!!!'.toUpperCase(),
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center,
                                textColor: themeState.themeClass.white,
                                textFontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(5.w),
                              child: CustomText(
                                textString: 'Some of the features in the app require you to have a stable internet connection!!!',
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center,
                                textColor: themeState.themeClass.white,
                                textFontSize: 10.sp,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: CustomButton(
                          buttonColor: themeState.themeClass.white,
                          buttonText: 'Check again'.toUpperCase(),
                          buttonTextColor: themeState.themeClass.black,
                          buttonSize: 90.w,
                          borderRadius: 15,
                          fontWeight: FontWeight.bold,
                          onTapEvent: (){
                            if(internetState is InternetDisconnected){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 3),
                                    content: Text('Please switch on your internet and try again!'),
                                  )
                              );
                            }
                            else{
                              Navigator.pop(context);
                            }
                          },
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
    },
  );
}
