import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolistgroup/screens/DetailsTaskScreen.dart';
import 'package:todolistgroup/theme/Palette.dart';
class ListWidget extends StatefulWidget{
  String trailing;
  String title;
  String subtitle;
  ListWidget({super.key, required this.trailing, required this.title, required this.subtitle});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {

  bool _isDone = false;

  void onPressed(){
    setState(() {
      _isDone = !_isDone;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child:Card(
        color: Palette.cardColor,
        child: ListTile(
          leading: IconButton(onPressed: onPressed, icon: _isDone ? Icon(Icons.check_circle_rounded, color: Colors.green,) : Icon(Icons.check_circle_outline) ),
          trailing: Text(widget.trailing),
          title: Text(widget.title, style: TextStyle(fontSize: 16, color: Colors.white, decoration: _isDone ? TextDecoration.lineThrough: TextDecoration.none ),),
          subtitle: Text(widget.subtitle, style: TextStyle(fontSize: 10, color: Colors.grey[400], decoration: _isDone ? TextDecoration.lineThrough: TextDecoration.none),),
          onTap: (){
            Navigator.pushNamed(context, DetailsTaskScreen.routeName);
          },

        )
      ),
    );
  }
}