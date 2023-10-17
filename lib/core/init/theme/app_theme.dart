import 'package:flutter/material.dart';

final MyAppTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.white,
    /*inputDecorationTheme: const InputDecorationTheme(
      //filled: true,//fillColor: Colors.green,
      labelStyle: TextStyle(color: Color(0xffE86CAB), fontSize: 13),
      hintStyle: TextStyle(color: Color(0xffE86CAB), fontSize: 13),
    ),*/


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

    inputDecorationTheme: const InputDecorationTheme(
    //filled: true,//fillColor: Colors.green,
    labelStyle: TextStyle(color: Color(0xff000000), fontSize: 13),
    hintStyle: TextStyle(color: Color(0xff000000), fontSize: 13),
      fillColor: Colors.black
),
    );
