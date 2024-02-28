import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfamily/core/theme/app_colors.dart';

class AppText extends Text {
  AppText(String text, {
    super.key,
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    required TextAlign textAlign,
  }) : super(
    text,
    style: GoogleFonts.pirataOne(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none),
    textAlign: textAlign,
  );

  factory AppText.title(String text, {
    Color color = const Color(0xFFD7AE0D),
    TextAlign textAlign = TextAlign.center,
  }) =>
      AppText(
        text,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: color,
        textAlign: textAlign,
      );

  factory AppText.description(String text,
      {TextAlign textAlign = TextAlign.start}) =>
      AppText(text,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
          textAlign: textAlign);

  factory AppText.tegText(String text, {
    Color color = AppColors.textColor,
    TextAlign textAlign = TextAlign.start,
  }) =>
      AppText(text,
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: color,
          textAlign: textAlign);

  factory AppText.desireSampleText(String text, {
    Color color = AppColors.textColor,
    TextAlign textAlign = TextAlign.start,
    FontWeight fontWeight = FontWeight.w600,
  }) =>
      AppText(text,
          fontSize: 18,
          fontWeight: fontWeight,
          color: color,
          textAlign: textAlign);

  factory AppText.dateTimeText(String text, {
    Color color = const Color(0xFFD7AE0D),
    TextAlign textAlign = TextAlign.start
  }) =>
      AppText(text,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: color,
          textAlign: textAlign);
}