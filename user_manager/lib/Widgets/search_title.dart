import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/cubit/appbar_cubit.dart';
import 'package:user_manager/cubit/searchbox_cubit.dart';

class SearchTitle extends StatelessWidget {
  const SearchTitle({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppbarCubit, AppbarState>(
      builder: (context, state) {
        if (state is AppbarSearchBox) {
          //Show the TextField on the app bar
          return TextField(
            decoration: const InputDecoration(
              hintText: 'Search...',
            ),
            onChanged: (str) =>
                BlocProvider.of<SearchboxCubit>(context).updateList(str: str),
          );
        }
        //Shows the Page title on the app bar
        return const Text('Users List');
      },
    );
  }
}
