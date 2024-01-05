import 'package:flutter/material.dart';
import 'package:todolistgroup/screens/MainScreen.dart';
import 'package:todolistgroup/screens/OnBoardingScreen.dart';
import 'package:todolistgroup/screens/LoginScreen.dart';
import 'package:todolistgroup/screens/SignUpScreen.dart';
import 'package:todolistgroup/screens/HomeScreen.dart';
import 'package:todolistgroup/theme/Palette.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Palette.darkModeTheme,
      initialRoute: MainScreenPage.routeName,
      routes: {
        MainScreenPage.routeName: (context) => MainScreenPage(),
        OnBoardingScreenPage.routeName: (context) => OnBoardingScreenPage(),
        LoginScreenPage.routeName: (context) => LoginScreenPage(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        HomeScreenPage.routeName: (context) => HomeScreenPage(),
      },
    );
  }
}



