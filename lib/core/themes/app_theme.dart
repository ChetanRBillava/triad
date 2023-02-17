import 'package:flutter/material.dart';

class AppTheme {
  ///main
  late Color backgroundColor;
  late Color formFieldBackgroundColor;
  late Color enabledFormFieldBorderColor;
  late Color focusedFormFieldBorderColor;

  ///selections
  late Color successColor;
  late Color dangerColor;
  late Color infoColor;
  late Color warningColor;

  late Color vegColor;
  late Color nonvegColor;
  late Color eggColor;

  ///texts
  late Color textColor_1;
  late Color textColor_2;
  late Color textCaptionColor;

  ///button
  late Color buttonBackgroundColor;
  late Color buttonBackgroundColor2;

  ///constant colors
  late Color white;
  late Color black;

  ///splash screen
  late Color splashBikeTileShadow;
  late Color splashQuizTileShadow;
  late Color splashFoodTileShadow;

  ///quiz screen
  late Color quizBackgroundColor;
  late Color quizButtonBackgroundColor;

  ///food screen
  late Color foodBackgroundColor;
  late Color foodPrimaryColor;
  late Color foodFormBackgroundColor;
  late Color foodButtonColor;
  late Color foodTextColor;
  late Color foodAppBarColor;

  ///bike screen
  late Color bikeBackgroundColor;
  late Color bikeLoginBackgroundColor;
  late Color bikeButtonBackgroundColor;
  late Color bikeAppBarColor;
  late Color bikeBorderColor;

}

class LightTheme extends AppTheme{
  LightTheme();

  ///main
  @override
  // TODO: implement primary
  Color get backgroundColor => const Color(0xffffffff);
  @override
  // TODO: implement primary
  Color get formFieldBackgroundColor => const Color(0xffE0DBDB);
  @override
  // TODO: implement primary
  Color get enabledFormFieldBorderColor => const Color(0xffE0DBDB);
  @override
  // TODO: implement primary
  Color get focusedFormFieldBorderColor => const Color(0xffE0DBDB);

  ///selections
  @override
  // TODO: implement primary
  Color get successColor => const Color(0xff2ee719);
  @override
  // TODO: implement primary
  Color get dangerColor => const Color(0xfff60f0f);
  @override
  // TODO: implement primary
  Color get infoColor => const Color(0xff719bf1);
  @override
  // TODO: implement primary
  Color get warningColor => const Color(0xffffd719);
  @override
  // TODO: implement primary
  Color get vegColor => const Color(0xff2dff00);
  @override
  // TODO: implement primary
  Color get nonvegColor => const Color(0xffff0000);
  @override
  // TODO: implement primary
  Color get eggColor => const Color(0xff440505);

  ///texts
  @override
  // TODO: implement primary
  Color get textColor_1 => const Color(0xff000000);
  @override
  // TODO: implement primary
  Color get textColor_2 => const Color(0xffffffff);
  @override
  // TODO: implement primary
  Color get textCaptionColor => const Color(0xff616060);

  ///button
  @override
  // TODO: implement primary
  Color get buttonBackgroundColor => const Color(0xff5789ee);
  @override
  // TODO: implement primary
  Color get buttonBackgroundColor2 => const Color(0xffffffff);

  ///constant colors
  @override
  // TODO: implement primary
  Color get white => const Color(0xffffffff);
  @override
  // TODO: implement primary
  Color get black => const Color(0xff000000);

  ///splash screen
  @override
  // TODO: implement primary
  Color get splashBikeTileShadow => const Color(0xff00FA19);
  @override
  // TODO: implement primary
  Color get splashQuizTileShadow => const Color(0xff6508FC);
  @override
  // TODO: implement primary
  Color get splashFoodTileShadow => const Color(0xffDB944B);


  ///quiz screen
  @override
  // TODO: implement primary
  Color get quizBackgroundColor => const Color(0xffA372F2);
  @override
  // TODO: implement primary
  Color get quizButtonBackgroundColor => const Color(0xffA372F2);


  ///food screen
  @override
  // TODO: implement primary
  Color get foodBackgroundColor => const Color(0xffDB944B);
  @override
  // TODO: implement primary
  Color get foodPrimaryColor => const Color(0xffDB944B);
  @override
  // TODO: implement primary
  Color get foodFormBackgroundColor => const Color(0xffffffff);
  @override
  // TODO: implement primary
  Color get foodButtonColor => const Color(0xffDB944B);
  @override
  // TODO: implement primary
  Color get foodTextColor => const Color(0xffDB944B);
  @override
  // TODO: implement primary
  Color get foodAppBarColor => const Color(0xffDB944B);


  ///bike screen
  @override
  // TODO: implement primary
  Color get bikeBackgroundColor => const Color(0xffDDECDF);
  @override
  // TODO: implement primary
  Color get bikeLoginBackgroundColor => const Color(0xff00AD11);
  @override
  // TODO: implement primary
  Color get bikeButtonBackgroundColor => const Color(0xffffffff);
  @override
  // TODO: implement primary
  Color get bikeAppBarColor => const Color(0xff00AD11);
  @override
  // TODO: implement primary
  Color get bikeBorderColor => const Color(0xff216709);
}