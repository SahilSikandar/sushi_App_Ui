import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KTextStyle {
  final double fontSize;
  final Color color;
  //final FontWeight fontWeight;

  KTextStyle({
    required this.fontSize,
    required this.color,
  });
  TextStyle getTextStyle() {
    return GoogleFonts.dmSerifDisplay(
      fontSize: fontSize,
      color: color,
      //fontWeight: fontWeight,
    );
  }
}
