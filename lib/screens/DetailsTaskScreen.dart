import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolistgroup/theme/Palette.dart';

import '../widgets/pinnedWidget.dart';

class DetailsTaskScreen extends StatelessWidget {
  const DetailsTaskScreen({super.key});
  static String routeName = "/tasks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Details Task"),
            expandedHeight: 250,
            centerTitle: true,
            pinned: true,
            floating: true,
            actions: [

            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.only(left: 10.0, top: 30, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25) ),
                  color: Colors.deepPurpleAccent,
                ) ,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Task title", style: TextStyle(fontSize: 15)),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(0, 0, 0, 0.2)
                              ),
                            child: Image.asset(
                                "assets/icons/pencil.png",
                              scale: 30,
                              color: Colors.grey[300],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8,),
                    Text("Un peu de blablabla !", style: GoogleFonts.dmSerifDisplay(fontSize: 25, fontWeight: FontWeight.bold),),
                    SizedBox(height: 30),
                    Text("Due date", style: TextStyle(fontSize: 15),),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.access_alarms),
                        SizedBox(width: 10),
                        Text("10 am - 1 pm",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold )),
                        SizedBox(width: 30),
                        Icon(Icons.calendar_month_outlined),
                        SizedBox(width: 10),
                        Text("May 29"),

                      ],
                    ),
                  ],
                ),
              ),

            ),
          ),

          SliverToBoxAdapter(
            child: Container(
                  height: 1000,
                )
          )
        ],

      ),
    );
  }
}
