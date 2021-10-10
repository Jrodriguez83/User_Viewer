import 'package:flutter/material.dart';

import 'Screens/app_router.dart';

void main() {
  runApp(UserManager());
}

class UserManager extends StatelessWidget {
  UserManager({Key? key}) : super(key: key);
  final router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange),
        backgroundColor: Colors.grey[200],
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}
