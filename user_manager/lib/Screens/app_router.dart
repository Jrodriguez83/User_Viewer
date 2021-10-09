import 'package:flutter/material.dart';
import 'package:user_manager/Screens/details_screen.dart';
import 'package:user_manager/Screens/main_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainScreen());

      case '/details_screen':
        return MaterialPageRoute(builder: (_) => DetailsScreen());
    }
  }
}
