import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistgroup/models/authenticated_user.dart';
import 'package:todolistgroup/screens/HomeScreen.dart';
import 'package:todolistgroup/services/UserService.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});
  static String routeName = "/login";

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String name = "";
  bool loading = false;
  bool displayInfo = false;

  void onPressed() async{

    // TODO: Validation du formulaire
    final UserService userService = UserService();
    Navigator.pop(context);
    setState(() {
      loading = true;
    });
    try{
      Map<String, dynamic> data = {
        'email': emailController.text,
        'strategy': 'local',
        'password': passwordController.text,
      };
      AuthenticatedUser user = await userService.login(data);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('authToken',user.accessToken!);
      prefs.setStringList('authUser', [user.user!.fullname!, user.user!.email!]);
      showToast("Utilisateur crée avec succes !", context: context);
      Navigator.pushReplacementNamed(context, HomeScreenPage.routeName);
    }on DioException catch(e){
      if (e.response != null) {
        print(e.response?.statusCode);
        print(e.response?.headers);
        print(e.response?.statusMessage);
      } else {
        print(e.message);
      }
      showToast("Une erreur est survenue !", context: context);
    }
  }
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
                  onPressed: onPressed,
                  child: const Text("OK")
              ),
            ],
          );
        }
    );
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
              controller: emailController,
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
                   displayDialog(context);

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