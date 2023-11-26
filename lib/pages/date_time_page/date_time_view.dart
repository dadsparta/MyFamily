import 'package:flutter/material.dart';
import 'package:myfamily/utilities/consts/colors.dart';

import '../../utilities/consts/texts.dart';

class DateTimePView extends StatefulWidget {
  const DateTimePView({Key? key}) : super(key: key);

  @override
  State<DateTimePView> createState() => _DateTimePViewState();
}

class _DateTimePViewState extends State<DateTimePView> {
  String getDifferenceOfDate() {
    DateTime startDate = DateTime(2023, 8, 25);
    DateTime endDate = DateTime.now();
    Duration difference = endDate.difference(startDate);
    int months = difference.inDays ~/ 30;
    int days = difference.inDays % 30;
    int hours = difference.inHours % 24;
    return "Мы вместе уже: $months месяца, $days дней и $hours часов.";
  }

  String difference = "";

  @override
  void initState() {
    super.initState();
    difference = getDifferenceOfDate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: firstColor,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(14),
          children: [
            const SizedBox(height: 40),
            Image.asset('assets/tokyo.png'),
            const SizedBox(height: 20),
            DateTimeText(
              text: difference,
            ),
          ],
        ),
      ),
    );
  }
}
