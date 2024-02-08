import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/consts/colors.dart';

class AppTab extends StatelessWidget {
  final String title;
  final Color color;

  const AppTab({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Tab(
            text: title,
          ),
        );
      },
    );
  }
}
