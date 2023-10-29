import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musmeramedya/core/constants/application/application_constants.dart';
import 'package:musmeramedya/core/init/theme/app_theme.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
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
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}

//servis zamanı ve para durumu kısmında sadece zaman yazıyor. Bir field'de zaman bir field'de para yazsın
//orders kısmı gün gün belge olarak kaydedilecek
//anlık fiyat hesaplaması için güzel bir yol bul
