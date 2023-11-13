import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musmeramedya/core/init/theme/app_theme.dart';
import 'core/init/constants/app/app_constants.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/network/main_build.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await _init();
  runApp(const MyApp());
}


Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ApplicationConstants.APPNAME,
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme,
      builder: MainBuild.build,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}



/*
Tasarım responsive olacak
M para birimi tasarla
webde whatsapp yönlendirmeyi aktif et
authstate dinlenmiyor sanki çıkış yapmıyor
*/



/*<key>LSApplicationQueriesSchemes</key>
<array>
<string>whatsapp</string>
</array>*/