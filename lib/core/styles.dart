import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static final title32Dark = GoogleFonts.roboto(
      fontSize: 32,
      color: const Color(0xffFFFFFF),
      fontWeight: FontWeight.w600);
  static final title22Dark = GoogleFonts.roboto(
      fontSize: 22,
      color: const Color(0xffFFFFFF),
      fontWeight: FontWeight.w600);
  static final title18Dark = GoogleFonts.roboto(
      fontSize: 18,
      color: const Color(0xffFFFFFF),
      fontWeight: FontWeight.w600);
  static final body20Dark = GoogleFonts.roboto(
      fontSize: 20,
      color: const Color(0xffFFFFFF),
      fontWeight: FontWeight.w400);
  static final body16Dark = GoogleFonts.roboto(
      fontSize: 16,
      color: const Color(0xffFFFFFF),
      fontWeight: FontWeight.w500);
  static final body12Dark = GoogleFonts.roboto(
      fontSize: 12,
      color: const Color(0xffFFFFFF),
      fontWeight: FontWeight.w400);
  static final title32Light = GoogleFonts.roboto(
      fontSize: 32,
      color: const Color(0xff121212),
      fontWeight: FontWeight.w600);
  static final title22Light = GoogleFonts.roboto(
      fontSize: 22,
      color: const Color(0xff121212),
      fontWeight: FontWeight.w600);
  static final title18Light = GoogleFonts.roboto(
      fontSize: 18,
      color: const Color(0xff121212),
      fontWeight: FontWeight.w600);
  static final body20Light = GoogleFonts.roboto(
      fontSize: 20,
      color: const Color(0xff121212),
      fontWeight: FontWeight.w400);
  static final body16Light = GoogleFonts.roboto(
      fontSize: 16,
      color: const Color(0xff121212),
      fontWeight: FontWeight.w500);
  static final body12Light = GoogleFonts.roboto(
      fontSize: 12,
      color: const Color(0xff121212),
      fontWeight: FontWeight.w400);
  static final cta18 = GoogleFonts.roboto(
      fontSize: 18, color: Colors.red, fontWeight: FontWeight.w600);
}
