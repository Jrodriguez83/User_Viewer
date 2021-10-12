import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/Models/users_model.dart';
import 'package:user_manager/Widgets/user_info_text.dart';
import 'package:user_manager/cubit/searchbox_cubit.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key, required this.users, this.controller = ''})
      : super(key: key);
  final List<User> users;
  final String controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchboxCubit, SearchboxState>(
      builder: (context, state) {
        if (state is UpdateList) {
          //Return the filtered list when applied
          return ListView(
            children: users
                .where((user) =>
                    user.name.toLowerCase().contains(state.value) ||
                    user.companyName.toLowerCase().contains(state.value) ||
                    user.email.toLowerCase().contains(state.value))
                .map((user) => InkWell(
                      key: ObjectKey(user.id),
                      onTap: () => Navigator.of(context)
                          .pushNamed('/details_screen', arguments: user),
                      child: _buildUserWidget(user: user),
                    ))
                .toList(),
          );
        }
        // return the list without filters
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
  //Widget to show the user's main contact info
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          UserInfoText(
            leading: 'Name : ',
            title: user.name,
            weight: FontWeight.bold,
            fontSize: 22,
          ),
          UserInfoText(leading: 'Company: ', title: user.companyName),
          UserInfoText(leading: 'Email: ', title: user.email),
        ],
      ),
    ),
  );
}
