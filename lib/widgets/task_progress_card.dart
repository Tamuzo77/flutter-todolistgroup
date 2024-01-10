import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todolistgroup/models/todo.dart';
import 'package:todolistgroup/services/ToDoService.dart';
import 'package:todolistgroup/theme/Palette.dart';

class TaskProgressCard extends StatefulWidget {
  const TaskProgressCard({super.key});

  @override
  State<TaskProgressCard> createState() => _TaskProgressCardState();
}

class _TaskProgressCardState extends State<TaskProgressCard> {

  List todos = [];

  void initilalizeTodos() async {
    try {
      todos = await ToDoService.getAllTodos();

    }on DioException catch (e) {

      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.statusCode);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }

    }
    setState(() async {


    });
  }
  @override
  void initState() {
    /*ToDoService.getAllTodos().then((value) {
      setState(() {
        print(value);
        todos = value;
      });
    });*/

    initilalizeTodos();
    super.initState();
  }
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
                  FutureBuilder(
                    future: ToDoService.getAllTodos(),
                    builder: (context, snapshot){
                      print(snapshot.data);
                      print(todos);
                      if(true){
                        return Text("30/${todos.length} task done ", style: TextStyle(color: Colors.grey[500]),);
                      }else{
                        return Text("No task found ", style: TextStyle(color: Colors.grey[500]),);
                      }
                    },
                  ),
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
