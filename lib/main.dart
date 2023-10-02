import 'package:flutter/material.dart';
import 'package:musmeramedya/core/init/theme/app_theme.dart';
import 'package:musmeramedya/ui/login/view/loginpage.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musmera Medya',
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
