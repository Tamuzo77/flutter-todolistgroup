import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolistgroup/screens/LoginScreen.dart';
import 'package:todolistgroup/screens/SignUpScreen.dart';
import 'package:todolistgroup/theme/Palette.dart';
class WelcomeScreen extends StatelessWidget {
  static String routeName = "/welcome";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                        "Welcome to UpToDo",
                      style: GoogleFonts.lobster(
                        fontSize: 35,
                        color: Palette.orangeColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                        "Please login to your account or create new account to continue",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 15,
                        color: Colors.grey[500]
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10,),
                    Image.asset("assets/images/loginEmote.png", scale: 3,)
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed:(){
                          Navigator.pushNamed(context, LoginScreenPage.routeName);
                        } ,
                        child: Text(
                            'Login',
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          textStyle: GoogleFonts.dmSerifDisplay(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          )
                        ),
                      ),
                      ElevatedButton(
                        onPressed:(){
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        } ,
                        child: Text(
                            'Sign Up',
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          textStyle: GoogleFonts.dmSerifDisplay(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
