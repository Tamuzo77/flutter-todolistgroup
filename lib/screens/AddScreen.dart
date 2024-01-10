import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddScreenPage extends StatefulWidget {
  static String routeName = "/add";
  AddScreenPage({super.key});

  @override
  State<AddScreenPage> createState() => _AddScreenPageState();
}

class _AddScreenPageState extends State<AddScreenPage> {
  String? priority = '';

  bool loading = false;

  displayDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Confirmation"),
            content: const Text("Etes-vous sûr de soumettre ce formulaire"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Annuler")),
              TextButton(onPressed: null, child: const Text("OK")),
            ],
          );
        });
  }

  DateTime selectDate= DateTime.now();
  final titleController = new TextEditingController();
  final descriptionController = new TextEditingController();


  Future<void> _selectDate(BuildContext context) async {

    final DateTime? picked= await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(2023,12),
        lastDate: DateTime(2101,12));
        if (picked!= null && picked!= selectDate)
          setState(() {
            selectDate = picked;
          }

          );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50)),
            Text('NEW TASK',
              style:TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                SizedBox(height:20.0),
                ElevatedButton(
                  onPressed: ()=>_selectDate(context),
                  child:Text('Select DeadLine')
                ),
              ],
            ),

          Container(
           padding: EdgeInsets.only(top: 30,left: 50,right: 50,bottom: 30),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintText: 'Task title',
                  ),
    ),
                SizedBox(height: 10,),


                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintText: 'Task description',

                  ),
                ),
              ],
            ),
          ),


            Padding(padding: EdgeInsets.only(top: 30)),



            RadioListTile(
              title: Text('HIGH'),
              value: "high",
              groupValue: priority,
              onChanged: (value) {
                setState(() {
                  priority = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('MEDIUM'),
              value: "medium",
              groupValue: priority,
              onChanged: (value) {
                setState(() {
                  priority = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('LOW'),
              value: "low",
              groupValue: priority,
              onChanged: (value) {
                setState(() {
                  priority = value.toString();
                });
              },
            ),
            Padding(padding: EdgeInsets.only(top: 80)),

            ElevatedButton(
                onPressed: () {
                  displayDialog(context);
                },
                child: loading
                    ? SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : Text("CREATE"))
          ],
        ),
      ),
    );
  }
}
