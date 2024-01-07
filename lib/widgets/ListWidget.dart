import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolistgroup/screens/DetailsTaskScreen.dart';
import 'package:todolistgroup/theme/Palette.dart';
class ListWidget extends StatelessWidget{
  String trailing;
  String title;
  String subtitle;
  ListWidget({super.key, required this.trailing, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child:Card(
        color: Palette.cardColor,
        child: ListTile(
          leading: Icon(Icons.check_circle_outline),
          trailing: Text(trailing),
          title: Text(title, style: TextStyle(fontSize: 16, color: Colors.white),),
          subtitle: Text(subtitle, style: TextStyle(fontSize: 10, color: Colors.grey[400]),),
          onTap: (){
            Navigator.pushNamed(context, DetailsTaskScreen.routeName);
          },

        )
      ),
    );
  }
}