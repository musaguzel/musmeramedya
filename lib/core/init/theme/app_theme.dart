import 'package:flutter/material.dart';

final MyAppTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,

    cardTheme: const CardTheme(
      color: Color(0xffF5F5F5),
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xffF8F8F8),
        iconTheme: IconThemeData(
          color: Colors.black, // Geri işareti rengini burada ayarlayabilirsiniz
        ),
      titleTextStyle: TextStyle(color: Colors.black,fontSize: 18)
    ),
    snackBarTheme: const SnackBarThemeData(
  contentTextStyle: TextStyle(color: Colors.black),

    ),
    inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xff263863), fontSize: 13),
    hintStyle: TextStyle(color: Color(0xff08214f), fontSize: 13),
      fillColor: Colors.red
),
    );
