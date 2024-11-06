import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/pages/detailtoko_screen.dart';
import 'pages/splash_screen.dart';
import 'pages/home_screen.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String detailToko = '/detailToko';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      home: (context) => HomeScreen(),
      detailToko: (context) => DetailTokoScreen(
        data: (ModalRoute.of(context)?.settings.arguments as Map)['data'],
        status: (ModalRoute.of(context)?.settings.arguments as Map)['status'],
      ),
    };
  }
}
