import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistgroup/screens/HomeScreen.dart';
import 'package:todolistgroup/screens/OnBoardingScreen.dart';
import 'package:todolistgroup/services/UserService.dart';
import 'package:todolistgroup/theme/Palette.dart';
class MainScreenPage extends StatefulWidget {
  static String routeName = "/";
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {


  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    UserService.checkUser().then((value) {
      if (value){
        Navigator.pushReplacementNamed(context, HomeScreenPage.routeName);
      }else{
        Navigator.pushReplacementNamed(context, OnBoardingScreenPage.routeName);
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main") ,
      ),
      body: Center(
        child: LoadingIndicator(
          indicatorType: Indicator.ballPulse,
          colors: [Colors.white],
          strokeWidth: 2,
          backgroundColor: Palette.backgroundColor,
          pathBackgroundColor: Colors.black,
        ),
      )
    );
  }
}
