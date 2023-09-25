import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  TitleText({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.museoModerno(fontSize: 32),);
  }
}
