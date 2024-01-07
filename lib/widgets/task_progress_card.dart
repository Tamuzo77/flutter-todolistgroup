import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todolistgroup/theme/Palette.dart';

class TaskProgressCard extends StatelessWidget {
  const TaskProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 125,
      decoration: BoxDecoration(
        color: Palette.cardColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Tâches",
                    style: GoogleFonts.gabriela(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text("30/40 task done ", style: TextStyle(color: Colors.grey[500]),),
                  SizedBox(height: 10,),
                  Container(
                    width: 100,
                    height: 30,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(35)
                    ),
                    child: Center(
                      child: Text(
                          "March 22",
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircularPercentIndicator(
                  radius: 40,
                lineWidth: 7,
                percent: 0.8,
                progressColor: Colors.blueAccent ,
                center: Text("80%", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ) ,
    );
  }
}
