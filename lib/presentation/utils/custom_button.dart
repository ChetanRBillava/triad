// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_text.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    Key? key,
    required this.buttonColor,

    this.buttonText,
    this.buttonTextColor,
    this.onTapEvent,
    this.buttonSize,
    this.borderRadius,
    this.onlyRadius,
    this.borderRadiusTL,
    this.borderRadiusTR,
    this.borderRadiusBL,
    this.borderRadiusBR,
    this.buttonTextSize,
    this.borderColor,
    this.fontWeight,
    this.textAlign,
    this.iconSize,
    this.iconColor,
    this.iconData,
  }) : super(key: key);

  ///required
  Color buttonColor;

  ///optional
  Function()? onTapEvent;
  String? buttonText;
  double? buttonSize, buttonTextSize, iconSize;
  bool? onlyRadius;
  double? borderRadius, borderRadiusTL, borderRadiusTR, borderRadiusBL, borderRadiusBR;
  Color? borderColor, buttonTextColor, iconColor;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  IconData? iconData;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapEvent,
      child: Container(
        width: widget.buttonSize,
        decoration: BoxDecoration(
            color: widget.buttonColor,
            border: Border.all(color: widget.borderColor??widget.buttonColor),
            borderRadius: widget.onlyRadius == true?
            BorderRadius.only(
              topLeft: Radius.circular(widget.borderRadiusTL??0.w),
              topRight: Radius.circular(widget.borderRadiusTR??0.w),
              bottomLeft: Radius.circular(widget.borderRadiusBL??0.w),
              bottomRight: Radius.circular(widget.borderRadiusBR??0.w),
            ):
            BorderRadius.all(
                Radius.circular(widget.borderRadius??0.w)
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(1.h),
          child: widget.iconData!=null?
              Icon(
                widget.iconData,
                size: widget.iconSize,
                color: widget.iconColor,
              ) :
          CustomText(
            textString: widget.buttonText as String,
            textFontSize: widget.buttonTextSize??12.sp,
            fontWeight: widget.fontWeight??FontWeight.normal,
            textColor: widget.buttonTextColor,
            textAlign: widget.textAlign??TextAlign.center,
          ),
        ),
      ),
    );
  }
}