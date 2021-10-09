import 'package:flutter/material.dart';
import 'package:user_manager/Models/users_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: Center(
        child: Text('Body'),
      ),
    );
  }
}
