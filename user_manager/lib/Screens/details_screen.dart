import 'package:flutter/material.dart';
import 'package:user_manager/Models/users_model.dart';
import 'package:user_manager/Widgets/user_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(body: UserDetails(user: user)),
    );
  }
}
