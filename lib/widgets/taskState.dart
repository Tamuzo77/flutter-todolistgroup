import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todolistgroup/services/ToDoService.dart';
import 'package:todolistgroup/widgets/pinnedWidget.dart';

class TaskState extends StatefulWidget {
  const TaskState({super.key});

  @override
  State<TaskState> createState() => _TaskStateState();
}


class _TaskStateState extends State<TaskState> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: SizedBox(
          height: 350,
          child: Row(children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 8),
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PinnedWidget(
                      onPressed: () {

                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tâches en cours",
                      style: GoogleFonts.gabriela(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Higher: ",
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                    SizedBox(height: 70),
              FutureBuilder(
                  future: ToDoService.getAllTodos() ,
                  builder: (context,snapshot){
                    return Column(
                    );
                  }),
                    LinearPercentIndicator(
                      percent: 0.7,
                      barRadius: Radius.circular(10),
                      trailing: Text("70%"),
                      progressColor: Colors.blueAccent,
                    ),
                    Text("Nbre taches en cours/nbre de tâches total")
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(children: [
                // TODO: Odilone ...
              Container(
                padding: EdgeInsets.only(left: 10, right: 8),
                    height: 200,
                    width: 1000,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PinnedWidget(
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(height: 10 ),

                        Text("Taches non commencees",
                            style: GoogleFonts.gabriela(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                        SizedBox(height: 45),
                        FutureBuilder(
                            future: ToDoService.getAllTodos() ,
                            builder: (context,snapshot){
                              return Column(
                                children: [
                                LinearPercentIndicator(
                                percent: 0.4,
                                progressColor: Colors.greenAccent[400],
                                barRadius: Radius.circular(10),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nbre de taches non commencees,",style: TextStyle(fontSize: 8),
                                  ),
                                  Text("40%",style: TextStyle(fontSize: 8))
                                ],
                              )
                                ]
                              );

                            }
                        ),


                      ],
                    ),
                  ),

                SizedBox(height: 15),

                Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 8),
                      width: 1000,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent[400],
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PinnedWidget(
                              onPressed: () {},
                            ),
                            // TODO: Onilari
                            Text(
                              'Taches terminées',
                              style: GoogleFonts.gabriela(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Programme fitness',
                              style: GoogleFonts.gabriela(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                    ),

                )
              ]),
            )
          ])),
    );
  }
}
