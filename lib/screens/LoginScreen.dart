import 'package:flutter/material.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});
  static String routeName = "/login";

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String name = "";
  bool loading = false;
  bool displayInfo = false;
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
                  child: const Text("Annuler")
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      loading = true;
                    });
                    Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        loading = false;
                        name = nameController.text;
                        displayInfo = true;
                      });
                    });
                  },
                  child: const Text("OK")
              ),
            ],
          );
        }
    );
  }

  void onPressed(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
     body: Center(
       child: Column(
         children:[

           Padding(padding: EdgeInsets.only(top: 50)),
           Text('LOG IN!',style: TextStyle(color: Colors.indigo,fontSize: 50,),
           textAlign: TextAlign.center,),
           Text('Happy to see you again!',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20)),
           Padding(padding: EdgeInsets.only(top: 70)),
           TextFormField(
              controller: nameController,
             decoration: InputDecoration(
             labelText: 'Nom',
             hintText: 'Entrez votre nom d''utilisateur',
             icon: Icon(Icons.person,color: Colors.blueAccent,),
           ),
             //validator: (val)=>val.length==0,
            keyboardType: TextInputType.text,
             validator: (String? value) {
               return value == null || value == "" ? "Ce champ est obligatoire" : null;
             },
           ),
           TextFormField(
             controller: passwordController,
             decoration: InputDecoration(
             labelText: 'Password',
             hintText: 'Entrez votre mot de passe',
             icon: Icon(Icons.password,color: Colors.blueAccent,),
           ),
             keyboardType: TextInputType.text,
             obscureText: true,
             validator: (String? value) {
               return value == null || value == "" ? "Ce champ est obligatoire" : null;
             },
           ),

           Padding(padding: EdgeInsets.only(top: 70)),
           ElevatedButton(
               onPressed: () {
                 if(formKey.currentState!.validate()) {
                   displayDialog(context);
                   onPressed;

                 }
               },
               child: loading ? SizedBox(
                 height: 30,
                 width: 30,
                 child: CircularProgressIndicator(
                   strokeWidth: 2,
                 ),
               ) : Text("DONE!")
           )

         ],
       ),
     ),
    );
  }
}