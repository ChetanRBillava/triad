import 'package:assignment/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/app_theme_cubit.dart';
import '../../router/app_router.dart';
import '../../utils/custom_text.dart';
import '../../widgets/bike_tile.dart';

class BikeHomeScreen extends StatefulWidget {
  const BikeHomeScreen({Key? key}) : super(key: key);

  @override
  State<BikeHomeScreen> createState() => _BikeHomeScreenState();
}

class _BikeHomeScreenState extends State<BikeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: (themeState as AppThemeSet).themeClass.bikeBackgroundColor,
            appBar: AppBar(
              backgroundColor: themeState.themeClass.bikeAppBarColor,
              leading: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(AppRouter.home);
                },
                child: Icon(
                  Icons.home,
                  size: 20.sp,
                ),
              ),
              title: CustomText(
                textString: 'Welcome John Doe',
                textColor: themeState.themeClass.textColor_2,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: true,
            ),
            body: SizedBox(
              height: 100.h,
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: 8,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return const BikeTile();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}