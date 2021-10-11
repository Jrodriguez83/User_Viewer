import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/Models/users_model.dart';
import 'package:user_manager/cubit/searchbox_cubit.dart';
import 'package:user_manager/cubit/users_cubit.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key, required this.users, this.controller = ''})
      : super(key: key);
  final List<User> users;
  final String controller;
  @override
  Widget build(BuildContext context) {
    final usersC = BlocProvider.of<UsersCubit>(context);
    return BlocBuilder<SearchboxCubit, SearchboxState>(
      builder: (context, state) {
        if (state is UpdateList) {
          return ListView(
            children: users
                .where(
                    (user) => user.username.toLowerCase().contains(state.value))
                .map((user) => InkWell(
                      key: ObjectKey(user.id),
                      onTap: () => Navigator.of(context)
                          .pushNamed('/details_screen', arguments: user),
                      child: _buildUserWidget(user: user),
                    ))
                .toList(),
          );
        }

        return ListView(
          children: users
              .map((user) => InkWell(
                    key: ObjectKey(user.id),
                    onTap: () => Navigator.of(context)
                        .pushNamed('/details_screen', arguments: user),
                    child: _buildUserWidget(user: user),
                  ))
              .toList(),
        );
      },
    );
  }
}

_buildUserWidget({required User user}) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          UserInfo(title: 'Username: ${user.username}'),
          UserInfo(title: 'Phone Number: ${user.phoneNumber}'),
        ],
      ),
    ),
  );
}

class UserInfo extends StatelessWidget {
  const UserInfo({
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
