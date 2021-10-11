import 'package:flutter/material.dart';

class MainInfoText extends StatelessWidget {
  const MainInfoText({
    Key? key,
    required this.title,
    this.fontSize = 15,
  }) : super(key: key);
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
