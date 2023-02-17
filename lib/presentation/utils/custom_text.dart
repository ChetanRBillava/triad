import 'package:assignment/logic/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


class CustomText extends StatefulWidget {
  const CustomText({
    Key? key,
    required this.textString,
    this.fontFamily,
    this.textFontSize,
    this.textColor,
    this.textAlign,
    this.fontWeight,
    this.overflow,
  }) : super(key: key);


  final String textString;
  final String? fontFamily;
  final double? textFontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return Text(
          widget.textString,
          textAlign: widget.textAlign ?? TextAlign.start,
          overflow: widget.overflow??TextOverflow.visible,
          style: widget.fontFamily=='faster one'?GoogleFonts.fasterOne(
            color: widget.textColor??(themeState as AppThemeSet).themeClass.textColor_1,
            fontSize: widget.textFontSize ?? 12.0.sp,
            fontWeight: widget.fontWeight ?? FontWeight.normal,
          ):GoogleFonts.poppins(
            color: widget.textColor??(themeState as AppThemeSet).themeClass.textColor_1,
            fontSize: widget.textFontSize ?? 12.0.sp,
            fontWeight: widget.fontWeight ?? FontWeight.normal,
          ),
        );
      },
    );
  }
}