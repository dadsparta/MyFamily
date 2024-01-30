import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfamily/core/consts/colors.dart';

class TitleText extends StatelessWidget {
  TitleText({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.pirataOne(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Color(0xFFD7AE0D),
          decoration: TextDecoration.none),
      textAlign: TextAlign.center,
    );
  }
}

class DescriptionText extends StatelessWidget {
  DescriptionText({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 24,
        color: AppColors.textColor,
        decoration: TextDecoration.none,
      ),
      showCursor: true,
      cursorWidth: 2,
      cursorRadius: Radius.circular(5),
    );
  }
}

class TegText extends StatelessWidget {
  TegText({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.pirataOne(
        fontSize: 22,
        color: AppColors.textColor,
        decoration: TextDecoration.none,
      ),
    );
  }
}

class DesireSampleText extends StatelessWidget {
  DesireSampleText({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors. textColor,
        decoration: TextDecoration.none,
      ),
    );
  }
}

class DateTimeText extends StatelessWidget {
  DateTimeText({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.pirataOne(
          fontSize: 24,
          color: Color(0xFFD7AE0D),
          decoration: TextDecoration.none),
      textAlign: TextAlign.center,
    );
  }
}
