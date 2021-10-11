import 'package:flutter/cupertino.dart';

class UserInfoField extends StatelessWidget {
  const UserInfoField(
      {Key? key,
      required this.title,
      required this.leading,
      this.weight = FontWeight.normal,
      this.fontSize = 20})
      : super(key: key);
  final String title;
  final String leading;
  final FontWeight weight;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          // Text(
          //   leading,
          //   style: TextStyle(fontSize: 22, fontWeight: weight),
          // ),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                  fontSize: fontSize,
                  overflow: TextOverflow.fade,
                  fontWeight: weight),
            ),
          )
        ],
      ),
    );
  }
}
