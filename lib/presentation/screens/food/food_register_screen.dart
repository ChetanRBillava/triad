import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/app_theme_cubit.dart';
import '../../router/app_router.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_text.dart';
import '../../utils/custom_text_field.dart';

class FoodRegisterScreen extends StatefulWidget {
  const FoodRegisterScreen({Key? key}) : super(key: key);

  @override
  State<FoodRegisterScreen> createState() => _FoodRegisterScreenState();
}

class _FoodRegisterScreenState extends State<FoodRegisterScreen> {
  TextEditingController nameController = TextEditingController(), emailController = TextEditingController(), passwordController = TextEditingController();
  bool isChecked = false;

  void checkValue(){
    setState(() {
      isChecked = !isChecked;
    });
  }

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
                          side: const BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
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
                                      color: themeState.themeClass.textColor_2,
                                      size: 60.sp,
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(2.w),
                                child: CustomTextField(
                                  controller: nameController,
                                  labelText: 'Name',
                                  hintText: 'Type here...',
                                  fillColor: themeState.themeClass.formFieldBackgroundColor,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(2.w),
                                child: CustomTextField(
                                  controller: emailController,
                                  labelText: 'E-mail',
                                  hintText: 'Type here...',
                                  fillColor: themeState.themeClass.formFieldBackgroundColor,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(2.w),
                                child: CustomTextField(
                                  controller: emailController,
                                  labelText: 'Password',
                                  hintText: 'Type here...',
                                  fillColor: themeState.themeClass.formFieldBackgroundColor,
                                ),
                              ),

                              GestureDetector(
                                onTap: (){
                                  checkValue();
                                },
                                child: Row(
                                  children: [
                                    Checkbox(value: isChecked, onChanged: (value){
                                      checkValue();
                                    }),
                                    CustomText(
                                      textString: 'I accept the Terms and Conditions',
                                      textFontSize: 10.sp,
                                      textColor: themeState.themeClass.textColor_1,
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(3.h),
                                child: CustomButton(
                                  buttonColor: themeState.themeClass.foodButtonColor,
                                  buttonSize: 50.w,
                                  buttonText: 'REGISTER',
                                  buttonTextColor: themeState.themeClass.textColor_2,
                                  fontWeight: FontWeight.bold,
                                  borderRadius: 10,
                                  onTapEvent: (){
                                    Navigator.of(context).pushNamed(AppRouter.foodHome);
                                  },
                                ),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                                      child: CustomText(
                                        textString: 'Have an account? ',
                                        textFontSize: 12.sp,
                                        textColor: themeState.themeClass.textColor_1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h, right: 5.w),
                                      child: CustomText(
                                        textString: 'Login here!',
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
