import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


class CustomText extends StatefulWidget {
  const CustomText({
    Key? key,
    required this.textString,
    this.textFontSize,
    this.textColor,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);


  final String textString;
  final double? textFontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.textString,
      textAlign: widget.textAlign??TextAlign.start,
      style: GoogleFonts.poppins(
          color: widget.textColor,
          fontSize: widget.textFontSize??12.0.sp,
          fontWeight: widget.fontWeight??FontWeight.normal,
      ),
    );
  }
}