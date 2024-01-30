import 'package:flutter/material.dart';
import 'package:myfamily/core/consts/colors.dart';
import 'package:myfamily/core/consts/texts.dart';
import 'package:flutter_date_difference/flutter_date_difference.dart';

class DateTimePView extends StatefulWidget {
  const DateTimePView({Key? key}) : super(key: key);

  @override
  State<DateTimePView> createState() => _DateTimePViewState();
}

class _DateTimePViewState extends State<DateTimePView> {

  String getDifferenceOfDate() {
    var _dateDifferenceInMounths = FlutterDateDifference().calculate(DateTime(2023, 8, 25), DateTime.now());
    return "We have been together for $_dateDifferenceInMounths" ;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const SizedBox(height: 140),
          Image.asset('assets/tokyo.png'),
          const SizedBox(height: 20),
          DateTimeText(
            text: getDifferenceOfDate(),
          ),
        ],
      ),
    );
  }
}
