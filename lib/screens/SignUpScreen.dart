import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todolistgroup/screens/LoginScreen.dart';
import 'package:todolistgroup/services/UserService.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String routeName = "/signup";

  @override
  State<SignUpScreen> createState() => _SignUpScreenPageState();
}

class _SignUpScreenPageState extends State<SignUpScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatpasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String name = "";
  bool loading = false;
  bool displayInfo = false;

  void onPressed() async {


      final UserService userService = UserService();

      try {
        Map<String, dynamic> dataUser = {
          'fullname': nameController.text,
          'email': emailController.text,
          'password': passwordController.text
        };
        var user = await userService.signUp(dataUser);
        
        print(user);
        Navigator.pushReplacementNamed(context, LoginScreenPage.routeName);
      } on DioException catch (e) {
        if (e.response != null) {
          print(e.response?.statusCode);
          print(e.response?.headers);
          print(e.response?.statusMessage);
        } else {
          print(e.message);
        }

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

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(

        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 80)),
              Text("SIGN UP!", style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.grey),),
              const Text("Tell us more about you!", style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.cyan
              ),),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //    Padding(padding: EdgeInsets.all({double left = 50.0,doubble top = 50.0,double right = 50.0,double bottom = 50.0,}),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'Your sweet name'
                        ),
                        validator: (String? value) {
                          return value == null || value == ""
                              ? "Ce champ est obligatoire"
                              : null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'E-mail adress?'
                        ),
                        validator: (String? value) {
                          return value == null || value == ""
                              ? "Ce champ est obligatoire"
                              : null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'A password is useful'
                        ),
                        validator: (String? value) {
                          return value == null || value == ""
                              ? "Ce champ est obligatoire"
                              : null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: repeatpasswordController,

                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Write it again, please :)'
                        ),
                        validator: (String? value) {
                          return value !=  passwordController.text ? "Password non identique" : "";
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 60)),
                      ElevatedButton(
                          onPressed: onPressed,
                          child: loading ? SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ) : Text("DONE!")
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      );
    }
  }
