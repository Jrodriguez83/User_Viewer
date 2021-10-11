import 'package:flutter/material.dart';

class MainInfoText extends StatelessWidget {
  const MainInfoText({
    Key? key,
    required this.title,
    this.leading = '',
    this.fontSize = 15,
  }) : super(key: key);
  final String title;
  final String leading;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Row(
        children: [
          Text(
            leading,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
          ),
          Expanded(
            child: Text(
              title,
              softWrap: false,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          )
        ],
      ),
    );
  }
}
