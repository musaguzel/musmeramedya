import 'package:flutter/material.dart';

final MyAppTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0XFF141527),

    cardTheme: const CardTheme(
      color:Color(0XFF141527), //Color(0xffF5F5F5),
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent, //Color(0xffF8F8F8),
        iconTheme: IconThemeData(
          color: Colors.white, // Geri işareti rengini burada ayarlayabilirsiniz
        ),
      titleTextStyle: TextStyle(color: Colors.white,fontSize: 18)
    ),
    snackBarTheme: const SnackBarThemeData(
  contentTextStyle: TextStyle(color: Colors.white),

    ),
    inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xff263863), fontSize: 13),
    hintStyle: TextStyle(color: Color(0xff08214f), fontSize: 13),
      fillColor: Colors.red
),
    );
