import 'package:flutter/material.dart';
import 'package:todolistgroup/screens/AddScreen.dart';
import 'package:todolistgroup/screens/WelcomeScreen.dart';
import 'package:todolistgroup/widgets/avatar_widget.dart';
import '../screens/Calendar.dart';
import 'package:todolistgroup/services/UserService.dart';
import '../screens/HomeScreen.dart';
import '../screens/SettingsScreen.dart';
class DrawerWidget extends StatelessWidget {

   DrawerWidget({super.key});
  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          children: [
            AvatarWidget(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.pushNamed(context, HomeScreenPage.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add"),
              onTap: (){
                Navigator.pushNamed(context, AddScreenPage.routeName);
              }
            ),
            ListTile(
              leading: Icon(Icons.calendar_today_rounded),
              title: Text("Calendar"),
              onTap: (){
                Navigator.pushNamed(context, Calendar.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: (){
                Navigator.pushNamed(context, SettingsScreenPage.routeName);
              }
            ),
            Padding(padding: EdgeInsets.only(top: 200,)),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              onTap: ()  {
                UserService.logOut();
                Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}

