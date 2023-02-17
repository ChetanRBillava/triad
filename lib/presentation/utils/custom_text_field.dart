
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../core/themes/app_theme.dart';
import '../../logic/cubit/app_theme_cubit.dart';
import 'custom_text.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.obscureText,
    this.labelText,
    this.labelTextFontSize,
    this.labelTextColor,
    this.labelFontWeight,
    this.hintText,
    this.hintTextFontSize,
    this.prefixIcon,
    this.suffixIcon,
    this.textCapitalization,
    this.textInputType,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.fillColor,
    this.focusedBorderWidth,
    this.focusedBorderColor,
    this.enabledBorderWidth,
    this.enabledBorderColor,
    this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool? obscureText;
  final String? labelText, hintText;
  final double? labelTextFontSize, hintTextFontSize;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final int? maxLength, minLines, maxLines;
  final double? focusedBorderWidth, enabledBorderWidth;
  final Color? focusedBorderColor, enabledBorderColor, fillColor, labelTextColor;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final FontWeight? labelFontWeight;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.labelText!=null? Padding(
              padding: EdgeInsets.only(left: 2.w, bottom: 1.h),
              child: CustomText(
                textString: widget.labelText as String,
                textFontSize: 14.sp,
                textColor: widget.labelTextColor??(themeState as AppThemeSet).themeClass.textColor_1,
                fontWeight: widget.labelFontWeight??FontWeight.normal,
              ),
            ):const SizedBox.shrink(),
            TextFormField(

              controller: widget.controller,
              validator: widget.validator,
              maxLength: widget.maxLength,
              minLines: widget.minLines,
              maxLines: widget.maxLines??1,
              keyboardType: widget.textInputType??TextInputType.text,
              textCapitalization: widget.textCapitalization??TextCapitalization.sentences,
              obscureText: widget.obscureText??false,
              style: GoogleFonts.poppins(
                color: (themeState as AppThemeSet).themeClass.textColor_1,
              ),
              decoration: (widget.prefixIcon!=null && widget.suffixIcon!=null)?InputDecoration(
                filled: widget.fillColor!=null?true:false,
                fillColor: widget.fillColor,
                prefixIcon: Icon(widget.prefixIcon),
                suffixIcon: widget.suffixIcon,
                /*labelText: widget.labelText,
                labelStyle: GoogleFonts.poppins(
                    color: (themeState).themeClass.textColor_1,
                    fontSize: widget.labelTextFontSize??14.sp,
                ),*/
                hintText: widget.hintText,
                hintStyle: GoogleFonts.poppins(
                    color: (themeState).themeClass.textCaptionColor,
                    fontSize: widget.hintTextFontSize??10.sp,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                      color: widget.focusedBorderColor??(themeState).themeClass.dangerColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                      color: widget.focusedBorderColor??(themeState).themeClass.focusedFormFieldBorderColor),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.w),
                    borderSide: BorderSide(width:  widget.enabledBorderWidth??1,
                        color: widget.enabledBorderColor??(themeState).themeClass.enabledFormFieldBorderColor)
                ),
              ):
              (widget.prefixIcon!=null)?InputDecoration(
                filled: widget.fillColor!=null?true:false,
                fillColor: widget.fillColor,
                prefixIcon: Icon(widget.prefixIcon),
                /*labelText: widget.labelText,
                labelStyle: GoogleFonts.poppins(
                    color: (themeState).themeClass.textColor_1,
                    fontSize: widget.labelTextFontSize??14.sp,
                ),*/
                hintText: widget.hintText,
                hintStyle: GoogleFonts.poppins(
                    color: (themeState).themeClass.textCaptionColor,
                    fontSize: widget.hintTextFontSize??10.sp,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                      color: widget.focusedBorderColor??(themeState).themeClass.dangerColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                      color: widget.focusedBorderColor??(themeState).themeClass.focusedFormFieldBorderColor),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.w),
                    borderSide: BorderSide(width:  widget.enabledBorderWidth??1,
                        color: widget.enabledBorderColor??(themeState).themeClass.enabledFormFieldBorderColor)
                ),
              ):
              (widget.suffixIcon!=null)?InputDecoration(
                filled: widget.fillColor!=null?true:false,
                fillColor: widget.fillColor,
                suffixIcon: widget.suffixIcon,
                /*labelText: widget.labelText,
                labelStyle: GoogleFonts.poppins(
                    color: (themeState).themeClass.textColor_1,
                    fontSize: widget.labelTextFontSize??14.sp,
                ),*/
                hintText: widget.hintText,
                hintStyle: GoogleFonts.poppins(
                    color: (themeState).themeClass.textCaptionColor,
                    fontSize: widget.hintTextFontSize??10.sp,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                      color: widget.focusedBorderColor??(themeState).themeClass.dangerColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                      color: widget.focusedBorderColor??(themeState).themeClass.focusedFormFieldBorderColor),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.w),
                    borderSide: BorderSide(width:  widget.enabledBorderWidth??1,
                        color: widget.enabledBorderColor??(themeState).themeClass.enabledFormFieldBorderColor)
                ),
              ):
              InputDecoration(
                filled: widget.fillColor!=null?true:false,
                fillColor: widget.fillColor,
                /*labelText: widget.labelText,
                labelStyle: GoogleFonts.poppins(
                    color: (themeState).themeClass.textColor_1,
                    fontSize: widget.labelTextFontSize??14.sp,
                ),*/
                hintText: widget.hintText,
                hintStyle: GoogleFonts.poppins(
                    color: (themeState).themeClass.textCaptionColor,
                    fontSize: widget.hintTextFontSize??10.sp,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                      color: widget.focusedBorderColor??(themeState).themeClass.dangerColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide: BorderSide(width: widget.focusedBorderWidth??1,
                      color: widget.focusedBorderColor??(themeState).themeClass.focusedFormFieldBorderColor),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.w),
                    borderSide: BorderSide(width:  widget.enabledBorderWidth??1,
                        color: widget.enabledBorderColor??(themeState).themeClass.enabledFormFieldBorderColor)
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}