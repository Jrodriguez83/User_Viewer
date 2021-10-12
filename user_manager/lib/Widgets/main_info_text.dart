import 'package:flutter/material.dart';

class MainInfoText extends StatelessWidget {
  const MainInfoText({
    Key? key,
    required this.title,
    this.leading = '',
    this.fontSize = 15,
    this.icon = Icons.account_circle_rounded,
  }) : super(key: key);
  final String title;
  final String leading;
  final double fontSize;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        // top: 8,
        bottom: 8,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              leading,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
          ),
          Row(
            children: [
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
              ),
              Icon(
                icon,
                size: 40,
              )
            ],
          ),
          const Divider(
            color: Colors.grey,
            height: 10,
          )
        ],
      ),
    );
  }
}
