import 'package:flutter/material.dart';

class MyTextTheme {
  MyTextTheme._init();

  static MyTextTheme? _instance;

  static MyTextTheme? get instance {
    _instance ??= MyTextTheme._init();
    return _instance;
  }

  //static const FONT = "tailu";

  final TextStyle generalTextStyle = const TextStyle(
    fontSize: 15,
    color: Colors.black
  );

}
