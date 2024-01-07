import 'package:flutter/material.dart';

class HomeScreenPage extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        leading: Icon(Icons.grid_view),
      ),
    );
  }
}
