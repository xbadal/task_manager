import 'package:flutter/material.dart';
import 'dimens.dart';

TextStyle textStylePoppins({
  Color? color,
  double fontSize = font_12,
  fontWeight = FontWeight.w500,
}) {
  return TextStyle(
    fontWeight: fontWeight,
    letterSpacing: 0.5,
    fontSize: fontSize,
    fontFamily: 'Poppins',
    color: color,
  );
}
