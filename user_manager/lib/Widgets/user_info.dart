import 'package:flutter/cupertino.dart';

class UserInfoField extends StatelessWidget {
  const UserInfoField({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        softWrap: false,
        style: const TextStyle(fontSize: 20, overflow: TextOverflow.fade),
      ),
    );
  }
}
