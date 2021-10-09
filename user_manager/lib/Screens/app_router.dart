import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/Models/users_model.dart';
import 'package:user_manager/Screens/details_screen.dart';
import 'package:user_manager/Screens/main_screen.dart';
import 'package:user_manager/cubit/posts_cubit.dart';
import 'package:user_manager/cubit/users_cubit.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _mainScreenBuilder();

      case '/details_screen':
        final user = settings.arguments as User;
        return _detailsScreenBuilder(user: user);
    }
  }
}

MaterialPageRoute _mainScreenBuilder() {
  return MaterialPageRoute(
      builder: (_) => BlocProvider(
            create: (_) => UsersCubit(),
            child: const MainScreen(),
          ));
}

MaterialPageRoute _detailsScreenBuilder({required User user}) {
  return MaterialPageRoute(
      builder: (_) => BlocProvider(
            create: (_) => PostsCubit(),
            child: DetailsScreen(user: user),
          ));
}
