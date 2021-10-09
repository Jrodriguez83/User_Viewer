import 'package:flutter/material.dart';
import 'package:user_manager/Models/users_model.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key, required this.users}) : super(key: key);
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: users
          .map((user) => InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed('/details_screen', arguments: user),
                child: ListTile(
                  title: Text(user.name),
                ),
              ))
          .toList(),
    );
  }
}
