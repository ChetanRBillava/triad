import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/app_theme_cubit.dart';
import '../../router/app_router.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_text.dart';
import '../../utils/custom_text_field.dart';

class BikeCheckoutScreen extends StatefulWidget {
  const BikeCheckoutScreen({Key? key}) : super(key: key);

  @override
  State<BikeCheckoutScreen> createState() => _BikeCheckoutScreenState();
}

class _BikeCheckoutScreenState extends State<BikeCheckoutScreen> {
  TextEditingController nameController = TextEditingController(), phoneController = TextEditingController(), emailController = TextEditingController(),
      modelController = TextEditingController(), daysController = TextEditingController(), pickupController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: (themeState as AppThemeSet).themeClass.backgroundColor,
            appBar: AppBar(
              backgroundColor: themeState.themeClass.bikeAppBarColor,
              automaticallyImplyLeading: true,
              title: CustomText(
                textString: 'CHECKOUT',
                textColor: themeState.themeClass.textColor_2,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(2.w),
                  child: CustomTextField(
                    controller: modelController,
                    labelText: 'Bike model',
                    hintText: 'Type here...',
                    fillColor: themeState.themeClass.formFieldBackgroundColor,
                    prefixIcon: Icons.directions_bike,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.w),
                  child: CustomTextField(
                    controller: daysController,
                    labelText: 'No of days',
                    hintText: 'Type here...',
                    fillColor: themeState.themeClass.formFieldBackgroundColor,
                    prefixIcon: Icons.calendar_month,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.w),
                  child: CustomTextField(
                    controller: pickupController,
                    labelText: 'Pickup point',
                    hintText: 'Type here...',
                    fillColor: themeState.themeClass.formFieldBackgroundColor,
                    prefixIcon: Icons.gps_fixed,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.w),
                  child: CustomTextField(
                    controller: nameController,
                    labelText: 'Name',
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
                    hintText: 'Type here...',
                    fillColor: themeState.themeClass.formFieldBackgroundColor,
                    prefixIcon: Icons.email,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.w),
                  child: CustomTextField(
                    controller: phoneController,
                    labelText: 'Phone',
                    hintText: 'Type here...',
                    fillColor: themeState.themeClass.formFieldBackgroundColor,
                    prefixIcon: Icons.phone,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        buttonColor: themeState.themeClass.bikeAppBarColor,
                        buttonSize: 85.w,
                        buttonText: 'PAY ₹9793'.toUpperCase(),
                        buttonTextColor: themeState.themeClass.textColor_2,
                        fontWeight: FontWeight.bold,
                        borderRadius: 5.w,
                        onTapEvent: (){
                          Navigator.of(context).pushNamed(AppRouter.bikeOrderComplete);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
