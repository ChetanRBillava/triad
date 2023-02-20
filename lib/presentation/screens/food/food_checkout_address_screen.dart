import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/bloc/food_bloc.dart';
import '../../router/app_router.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_text.dart';
import '../../utils/custom_text_field.dart';

class FoodCheckoutAddressScreen extends StatefulWidget {
  const FoodCheckoutAddressScreen({Key? key}) : super(key: key);

  @override
  State<FoodCheckoutAddressScreen> createState() =>
      _FoodCheckoutAddressScreenState();
}

class _FoodCheckoutAddressScreenState extends State<FoodCheckoutAddressScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(), phoneController = TextEditingController(),
      emailController = TextEditingController(), addressController = TextEditingController(), pincodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, foodState) {
        nameController.text = (foodState as FoodDetails).name;
        emailController.text = (foodState).email;
        return BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, themeState) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: (themeState as AppThemeSet).themeClass.backgroundColor,
                appBar: AppBar(
                  backgroundColor: themeState.themeClass.foodAppBarColor,
                  automaticallyImplyLeading: true,
                  title: CustomText(
                    textString: 'DELIVERY ADDRESS',
                    textColor: themeState.themeClass.textColor_2,
                    fontWeight: FontWeight.bold,
                  ),
                  centerTitle: true,
                ),
                body: ListView(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3.w),
                            child: CustomTextField(
                              controller: nameController,
                              labelText: 'Name',
                              hintText: 'Type here...',
                              fillColor: themeState.themeClass.formFieldBackgroundColor,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This value cannot be empty';
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.w),
                            child: CustomTextField(
                              controller: emailController,
                              labelText: 'E-mail',
                              hintText: 'Type here...',
                              fillColor: themeState.themeClass.formFieldBackgroundColor,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This value cannot be empty';
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.w),
                            child: CustomTextField(
                              controller: phoneController,
                              labelText: 'Phone',
                              hintText: 'Type here...',
                              fillColor: themeState.themeClass.formFieldBackgroundColor,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This value cannot be empty';
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.w),
                            child: CustomTextField(
                              controller: addressController,
                              labelText: 'Address',
                              hintText: 'Type here...',
                              fillColor: themeState.themeClass.formFieldBackgroundColor,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This value cannot be empty';
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.w),
                            child: CustomTextField(
                              controller: pincodeController,
                              labelText: 'Pincode',
                              hintText: 'Type here...',
                              fillColor: themeState.themeClass.formFieldBackgroundColor,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This value cannot be empty';
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: CustomButton(
                            buttonColor: themeState.themeClass.foodButtonColor,
                            buttonSize: 85.w,
                            buttonText: 'Proceed to pay ₹${(foodState).grandTotal.toStringAsFixed(2)}'.toUpperCase(),
                            buttonTextColor: themeState.themeClass.textColor_2,
                            fontWeight: FontWeight.bold,
                            borderRadius: 5.w,
                            onTapEvent: (){
                              if(formKey.currentState?.validate()==true){
                                BlocProvider.of<FoodBloc>(context).add(
                                    FoodCheckout(
                                        context: context, name: nameController.text, email: emailController.text, phone: phoneController.text,
                                      address: addressController.text, pincode: pincodeController.text
                                    )
                                );
                              }
                            },
                          ),
                        ),
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
