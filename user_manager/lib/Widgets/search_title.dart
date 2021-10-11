import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/cubit/appbar_cubit.dart';
import 'package:user_manager/cubit/searchbox_cubit.dart';
import 'package:user_manager/cubit/users_cubit.dart';

enum TitleMode {
  title,
  searchbox,
}

class SearchTitle extends StatelessWidget {
  SearchTitle({
    Key? key,
    this.mode = TitleMode.title,
  }) : super(key: key);

  final TitleMode mode;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppbarCubit, AppbarState>(
      builder: (context, state) {
        if (state is AppbarSearchBox) {
          return TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Search...',
            ),
            onChanged: (str) =>
                BlocProvider.of<SearchboxCubit>(context).updateList(str: str),
          );
        }

        return const Text('MainScreen');
      },
    );
  }
}
