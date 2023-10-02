import 'package:flutter/material.dart';
import '../../init/navigation/navigation_service.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {

  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
  double dyanmicWidth(double value) =>
      MediaQuery.of(context).size.width * value;


  NavigationService navigation = NavigationService.instance;

}