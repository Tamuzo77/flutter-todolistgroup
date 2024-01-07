import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/Calendar.dart';
import '../theme/Palette.dart';
class DrawerWidget extends StatelessWidget {

  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              color: Colors.deepOrange,
            ),
            ListTile(
              leading: Icon(Icons.calendar_today_rounded),
              title: Text("Calendar"),
              onTap: (){
                Navigator.pushNamed(context, Calendar.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
