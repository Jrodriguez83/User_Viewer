import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainScreen'),
      ),
      body: Center(
        child: InkWell(
            onTap: () => Navigator.of(context).pushNamed('/details_screen'),
            child: Text('Body')),
      ),
    );
  }
}
