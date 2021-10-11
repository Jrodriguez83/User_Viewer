import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/Widgets/search_title.dart';
import 'package:user_manager/Widgets/user_list.dart';
import 'package:user_manager/cubit/appbar_cubit.dart';
import 'package:user_manager/cubit/users_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: SearchTitle(),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<AppbarCubit>(context).changeTitle();
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: InkWell(
            onTap: () => Navigator.of(context).pushNamed('/details_screen'),
            child: BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) {
                if (state is! LoadedUsers) {
                  BlocProvider.of<UsersCubit>(context).getUsers();
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final users = state.users;
                return UserList(
                  users: users,
                );
              },
            )),
      ),
    );
  }
}
