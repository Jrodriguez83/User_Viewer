import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/cubit/appbar_cubit.dart';
import 'package:user_manager/cubit/searchbox_cubit.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.onPressHandler,
  }) : super(key: key);

  final Function onPressHandler;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppbarCubit, AppbarState>(
      builder: (context, state) {
        if (state is AppbarSearchBox) {
          return IconButton(
            onPressed: () {
              BlocProvider.of<SearchboxCubit>(context).updateList(str: '');
              onPressHandler();
            },
            icon: const Icon(Icons.keyboard_backspace_rounded),
          );
        }

        return IconButton(
          onPressed: () => onPressHandler(),
          icon: const Icon(Icons.search),
        );
      },
    );
  }
}
