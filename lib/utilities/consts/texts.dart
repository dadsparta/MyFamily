import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfamily/utilities/consts/colors.dart';

class TitleText extends StatelessWidget {
  TitleText({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: textColor,
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
        color: textColor,
        decoration: TextDecoration.none,
      ),
      showCursor: true,
      cursorWidth: 2,
      cursorRadius: Radius.circular(5),
      toolbarOptions: ToolbarOptions(copy: true, selectAll: true),
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
        color: textColor,
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
      style: GoogleFonts.montserrat(
          fontSize: 24, color: textColor, decoration: TextDecoration.none),
      textAlign: TextAlign.center,
    );
  }
}
