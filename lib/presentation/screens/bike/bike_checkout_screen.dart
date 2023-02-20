import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/bloc/bike_bloc.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(), phoneController = TextEditingController(), emailController = TextEditingController(),
      modelController = TextEditingController(), daysController = TextEditingController(), pickupController = TextEditingController();
  bool amtSet = false;
  int amt = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BikeBloc, BikeState>(
      builder: (context, bikeState) {
        nameController.text = (bikeState as BikeDetails).name;
        phoneController.text = (bikeState).phone;
        emailController.text = (bikeState).email;
        modelController.text = (bikeState).bikeDetails['Name'];
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
                body: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2.w),
                          child: CustomTextField(
                            enabled: false,
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
                            textInputType: TextInputType.number,
                            labelText: 'No of days',
                            hintText: 'Type here...',
                            fillColor: themeState.themeClass.formFieldBackgroundColor,
                            prefixIcon: Icons.calendar_month,
                            onChanged: (val){
                              int? num = int.tryParse(daysController.text);
                              if(num == null){
                                setState(() {
                                  amtSet = false;
                                });
                              }
                              else{
                                amt = num * (int.parse(bikeState.bikeDetails['Amount']));
                                setState(() {
                                  amtSet = true;
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This value cannot be empty';
                              }
                              else{
                                int? num = int.tryParse(daysController.text);
                                if(num == null){
                                  return 'Please enter a proper value';
                                }
                                else{
                                  return null;
                                }
                              }
                            },
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
                          padding: EdgeInsets.all(2.w),
                          child: CustomTextField(
                            controller: nameController,
                            labelText: 'Name',
                            hintText: 'Type here...',
                            fillColor: themeState.themeClass.formFieldBackgroundColor,
                            prefixIcon: Icons.account_circle,
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
                          padding: EdgeInsets.all(2.w),
                          child: CustomTextField(
                            controller: emailController,
                            labelText: 'E-mail',
                            hintText: 'Type here...',
                            fillColor: themeState.themeClass.formFieldBackgroundColor,
                            prefixIcon: Icons.email,
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
                            prefixIcon: Icons.phone,
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
                          padding: EdgeInsets.only(top: 3.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                buttonColor: amtSet?themeState.themeClass.bikeButtonBackgroundColor2:themeState.themeClass.bikeButtonBackgroundColorDisabled,
                                buttonSize: 85.w,
                                buttonText: amtSet?'PAY ₹$amt'.toUpperCase():'Enter all details',
                                buttonTextColor: amtSet?themeState.themeClass.textColor_2:themeState.themeClass.textColor_1,
                                fontWeight: FontWeight.bold,
                                borderRadius: 5.w,
                                onTapEvent: (){
                                  if(formKey.currentState?.validate()==true){
                                    Navigator.of(context).pushNamed(AppRouter.bikeOrderComplete);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
