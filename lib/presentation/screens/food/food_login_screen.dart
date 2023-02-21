import 'package:assignment/logic/bloc/food_bloc.dart';
import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:assignment/presentation/router/app_router.dart';
import 'package:assignment/presentation/utils/custom_button.dart';
import 'package:assignment/presentation/utils/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/bloc/bike_bloc.dart';
import '../../utils/custom_text.dart';

class FoodLoginScreen extends StatefulWidget {
  const FoodLoginScreen({Key? key}) : super(key: key);

  @override
  State<FoodLoginScreen> createState() => _FoodLoginScreenState();
}

class _FoodLoginScreenState extends State<FoodLoginScreen> {
  TextEditingController emailController = TextEditingController(), passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return SafeArea(
            child: Scaffold(
              backgroundColor:  (themeState as AppThemeSet).themeClass.foodBackgroundColor,
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: themeState.themeClass.white, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: themeState.themeClass.formFieldBackgroundColor,
                        elevation: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 90.w,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: themeState.themeClass.foodBackgroundColor,
                                    shape: BoxShape.circle
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.w),
                                    child: Icon(
                                      Icons.restaurant,
                                      color: themeState.themeClass.white,
                                      size: 60.sp,
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(2.w),
                                child: CustomTextField(
                                  controller: emailController,
                                  labelText: 'E-mail',
                                  labelTextColor: themeState.themeClass.textColor_1,
                                  hintText: 'Type here...',
                                  fillColor: themeState.themeClass.foodFormBackgroundColor,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(2.w),
                                child: CustomTextField(
                                  controller: passwordController,
                                  labelText: 'Password',
                                  labelTextColor: themeState.themeClass.textColor_1,
                                  hintText: 'Type here...',
                                  fillColor: themeState.themeClass.foodFormBackgroundColor,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(3.h),
                                child: CustomButton(
                                  buttonColor: themeState.themeClass.foodButtonColor,
                                  buttonSize: 50.w,
                                  buttonText: 'LOGIN',
                                  buttonTextColor: themeState.themeClass.white,
                                  fontWeight: FontWeight.bold,
                                  borderRadius: 10,
                                  onTapEvent: (){
                                    BlocProvider.of<FoodBloc>(context).add(FoodUserLogin(
                                        context: context,
                                        email: emailController.text, password: passwordController.text
                                    ));
                                  },
                                ),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushNamed(AppRouter.foodRegister);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                                      child: CustomText(
                                        textString: 'New user? ',
                                        textFontSize: 12.sp,
                                        textColor: themeState.themeClass.textColor_1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h, right: 5.w),
                                      child: CustomText(
                                        textString: 'Register here!',
                                        textFontSize: 12.sp,
                                        textColor: themeState.themeClass.foodTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
        );
      },
    );
  }
}
