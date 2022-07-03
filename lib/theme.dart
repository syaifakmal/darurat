import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color white = Color(0xffFDFDFD);
const Color slightGrey = Color(0xffF5F5F5);
const Color lightGrey = Color(0xFFEFEFEF);
const Color grey = Color(0xFF6B6B6B);
const Color black = Color(0xFF222429);

class Textstyle {
  static TextStyle regular = GoogleFonts.openSans(
    color: black,
    fontWeight: FontWeight.w400,
  );

  static TextStyle medium = GoogleFonts.openSans(
    color: black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle semiBold = GoogleFonts.openSans(
    color: black,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bold = GoogleFonts.openSans(
    color: black,
    fontWeight: FontWeight.w700,
  );
}
