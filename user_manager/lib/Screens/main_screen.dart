import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/Widgets/search_button.dart';
import 'package:user_manager/Widgets/search_title.dart';
import 'package:user_manager/Widgets/user_list.dart';
import 'package:user_manager/cubit/appbar_cubit.dart';
import 'package:user_manager/cubit/users_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const SearchTitle(),
        actions: [
          SearchButton(
              onPressHandler: BlocProvider.of<AppbarCubit>(context).changeTitle)
        ],
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is! LoadedUsers) {
            BlocProvider.of<UsersCubit>(context).getUsers();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return UserList(
            users: state.users,
          );
        },
      ),
    );
  }
}
