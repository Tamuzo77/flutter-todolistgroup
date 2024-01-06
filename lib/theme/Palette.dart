import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Palette{

  static const backgroundColor = Color.fromRGBO(1, 11, 23, 1.0);
  static const titleColor = Color.fromRGBO(216, 209, 209, 1.0);
  static const mauveColor = Color.fromRGBO(207, 21, 222, 1.0);
  static const verteColor = Color.fromRGBO(70, 211, 9, 1.0);
  static const skyblueColor = Color.fromRGBO(0, 185, 255, 1.0);
  static const blueNightColor = Color.fromRGBO(1, 6, 88, 1.0);
  static const cardColor = Color.fromRGBO(37, 37, 37, 1.0);
  static const buttonColor = Colors.blueAccent;
  static const orangeColor = Color.fromRGBO(255, 129, 3, 1.0);

  static var darkModeTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardColor,
    focusColor: mauveColor,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      elevation: 0,
      foregroundColor: titleColor,
        centerTitle: true,
      titleTextStyle: GoogleFonts.lobster(
        fontSize: 24,
        fontWeight: FontWeight.w500
      )
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: blueNightColor,
    )
  );

}