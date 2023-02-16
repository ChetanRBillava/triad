import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

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
  TextEditingController nameController = TextEditingController(), phoneController = TextEditingController(),
      emailController = TextEditingController(), addressController = TextEditingController(), pincodeController = TextEditingController();
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
                textString: 'DELIVERY ADDRESS',
                textColor: themeState.themeClass.textColor_2,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: true,
            ),
            body: SizedBox(
              height: 100.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3.w),
                        child: CustomTextField(
                          controller: nameController,
                          labelText: 'Name',
                          hintText: 'Type here...',
                          fillColor: themeState.themeClass.formFieldBackgroundColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.w),
                        child: CustomTextField(
                          controller: emailController,
                          labelText: 'E-mail',
                          hintText: 'Type here...',
                          fillColor: themeState.themeClass.formFieldBackgroundColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.w),
                        child: CustomTextField(
                          controller: phoneController,
                          labelText: 'Phone',
                          hintText: 'Type here...',
                          fillColor: themeState.themeClass.formFieldBackgroundColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.w),
                        child: CustomTextField(
                          controller: addressController,
                          labelText: 'Address',
                          hintText: 'Type here...',
                          fillColor: themeState.themeClass.formFieldBackgroundColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.w),
                        child: CustomTextField(
                          controller: pincodeController,
                          labelText: 'Pincode',
                          hintText: 'Type here...',
                          fillColor: themeState.themeClass.formFieldBackgroundColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: CustomButton(
                      buttonColor: themeState.themeClass.foodButtonColor,
                      buttonSize: 85.w,
                      buttonText: 'Proceed to pay'.toUpperCase(),
                      buttonTextColor: themeState.themeClass.textColor_2,
                      fontWeight: FontWeight.bold,
                      borderRadius: 5.w,
                      onTapEvent: (){
                        Navigator.of(context).pushNamed(AppRouter.foodOrderComplete);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
