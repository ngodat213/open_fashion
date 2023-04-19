import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TxtStyle {
  TxtStyle._();

  static TextStyle font16(Color? color) => GoogleFonts.tenorSans(
        color: color ?? Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle font15(Color? color) => GoogleFonts.tenorSans(
        color: color ?? Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );

  static TextStyle font14(Color? color) => GoogleFonts.tenorSans(
        color: color ?? Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle font12(Color? color) => GoogleFonts.tenorSans(
        color: color ?? Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  static TextStyle font10(Color? color) => GoogleFonts.tenorSans(
        color: color ?? Colors.black,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      );
}
