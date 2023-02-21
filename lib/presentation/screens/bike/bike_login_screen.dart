import 'package:assignment/logic/bloc/bike_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/app_theme_cubit.dart';
import '../../router/app_router.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_text.dart';
import '../../utils/custom_text_field.dart';

class BikeLoginScreen extends StatefulWidget {
  const BikeLoginScreen({Key? key}) : super(key: key);

  @override
  State<BikeLoginScreen> createState() => _BikeLoginScreenState();
}

class _BikeLoginScreenState extends State<BikeLoginScreen> {
  TextEditingController nameController = TextEditingController(), emailController = TextEditingController(),
      phoneController = TextEditingController(), passwordController = TextEditingController();
  bool isChecked = false, inLogin = true;

  void checkValue(){
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BikeBloc, BikeState>(
      builder: (context, bikeState) {
        return BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, themeState) {
            return SafeArea(
                child: Scaffold(
                  backgroundColor:  (themeState as AppThemeSet).themeClass.backgroundColor,
                  body: ListView(
                    children: [
                      SizedBox(height: 5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                color: themeState.themeClass.bikeLoginBackgroundColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: themeState.themeClass.white, width: 1),
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

                                      ///heading
                                      Padding(
                                        padding: EdgeInsets.all(5.w),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap:(){
                                                setState(() {
                                                  inLogin = true;
                                                });
                                              },
                                              child: CustomText(
                                                textString: 'LOGIN',
                                                textFontSize: inLogin?24.sp:16.sp,
                                                fontWeight: inLogin?FontWeight.bold:FontWeight.normal,
                                                textColor: inLogin?themeState.themeClass.white:themeState.themeClass.black,
                                              ),
                                            ),
                                            Container(height: 20.sp, width: 1.w, color: themeState.themeClass.textColor_2,),
                                            GestureDetector(
                                              onTap:(){
                                                setState(() {
                                                  inLogin = false;
                                                });
                                              },
                                              child: CustomText(
                                                textString: 'REGISTER',
                                                textFontSize: !inLogin?24.sp:16.sp,
                                                fontWeight: !inLogin?FontWeight.bold:FontWeight.normal,
                                                textColor: !inLogin?themeState.themeClass.white:themeState.themeClass.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                      inLogin?Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(2.w),
                                            child: CustomTextField(
                                              controller: emailController,
                                              labelText: 'E-mail',
                                              labelTextColor: themeState.themeClass.white,
                                              labelFontWeight: FontWeight.bold,
                                              hintText: 'Type here...',
                                              fillColor: themeState.themeClass.formFieldBackgroundColor,
                                              prefixIcon: Icons.email,
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.all(2.w),
                                            child: CustomTextField(
                                              controller: passwordController,
                                              labelText: 'Password',
                                              labelTextColor: themeState.themeClass.white,
                                              labelFontWeight: FontWeight.bold,
                                              hintText: 'Type here...',
                                              fillColor: themeState.themeClass.formFieldBackgroundColor,
                                              prefixIcon: Icons.key,
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.all(3.h),
                                            child: CustomButton(
                                              buttonColor: themeState.themeClass.bikeButtonBackgroundColor,
                                              buttonSize: 65.w,
                                              buttonText: 'LOGIN',
                                              fontWeight: FontWeight.bold,
                                              borderRadius: 10,
                                              onTapEvent: (){
                                                BlocProvider.of<BikeBloc>(context).add(BikeUserLogin(
                                                    context: context,
                                                    email: emailController.text, password: passwordController.text
                                                ));
                                              },
                                            ),
                                          ),
                                        ],
                                      ):
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(2.w),
                                            child: CustomTextField(
                                              controller: nameController,
                                              labelText: 'Name',
                                              labelTextColor: themeState.themeClass.white,
                                              labelFontWeight: FontWeight.bold,
                                              hintText: 'Type here...',
                                              fillColor: themeState.themeClass.formFieldBackgroundColor,
                                              prefixIcon: Icons.account_circle,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(2.w),
                                            child: CustomTextField(
                                              controller: emailController,
                                              labelText: 'E-mail',
                                              labelTextColor: themeState.themeClass.white,
                                              labelFontWeight: FontWeight.bold,
                                              hintText: 'Type here...',
                                              fillColor: themeState.themeClass.formFieldBackgroundColor,
                                              prefixIcon: Icons.email,
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.all(2.w),
                                            child: CustomTextField(
                                              controller: phoneController,
                                              labelText: 'Phone',
                                              labelTextColor: themeState.themeClass.white,
                                              labelFontWeight: FontWeight.bold,
                                              hintText: 'Type here...',
                                              fillColor: themeState.themeClass.formFieldBackgroundColor,
                                              prefixIcon: Icons.phone,
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.all(2.w),
                                            child: CustomTextField(
                                              controller: passwordController,
                                              labelText: 'Password',
                                              labelTextColor: themeState.themeClass.white,
                                              labelFontWeight: FontWeight.bold,
                                              hintText: 'Type here...',
                                              fillColor: themeState.themeClass.formFieldBackgroundColor,
                                              prefixIcon: Icons.lock,
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
                                              buttonColor: themeState.themeClass.bikeButtonBackgroundColor,
                                              buttonSize: 65.w,
                                              buttonText: 'REGISTER',
                                              fontWeight: FontWeight.bold,
                                              borderRadius: 10,
                                              onTapEvent: (){

                                                if(!isChecked){
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(
                                                        duration: Duration(seconds: 3),
                                                        content: Text('Please click on the checkbox'),
                                                      )
                                                  );
                                                }
                                                else{
                                                  BlocProvider.of<BikeBloc>(context).add(BikeUserRegister(
                                                      context: context, name: nameController.text, email: emailController.text,
                                                      phone: phoneController.text, password: passwordController.text
                                                  ));
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
