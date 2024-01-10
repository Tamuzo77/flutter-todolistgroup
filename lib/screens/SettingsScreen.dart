import 'package:flutter/material.dart';
class SettingsScreenPage extends StatelessWidget {
  static String routeName = "/settings";
  const SettingsScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Card(
          elevation: 50,
          borderOnForeground: true,
          color: Colors.blueAccent,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.person),
              //  title: TextButton(onPressed: () {},child: ,),
                subtitle: Text(''),
              )
            ],
          ),
        ),
      ),
    );
  }
}