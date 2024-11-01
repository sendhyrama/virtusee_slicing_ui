import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/home_screen.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      home: (context) => HomeScreen(),
    };
  }
}
