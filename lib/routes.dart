import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/pages/detailtoko_screen.dart';
import 'package:virtusee_slicing_ui/pages/form_cekstok_screen.dart';
import 'package:virtusee_slicing_ui/pages/form_list_screen.dart';
import 'pages/splash_screen.dart';
import 'pages/home_screen.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String detailToko = '/detailToko';
  static const String formList = '/formList';
  static const String formCekStok = '/formCekStok';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      home: (context) => HomeScreen(name: ModalRoute.of(context)?.settings.arguments as String?),
      detailToko: (context) => DetailTokoScreen(
        data: (ModalRoute.of(context)?.settings.arguments as Map)['data'],
        status: (ModalRoute.of(context)?.settings.arguments as Map)['status'],
        checkOut: (ModalRoute.of(context)?.settings.arguments as Map)['checkOut'],
      ),
      formList: (context) => FormListScreen(
        data: (ModalRoute.of(context)?.settings.arguments as Map)['data'],
        done: (ModalRoute.of(context)?.settings.arguments as Map)['done'],
      ),
      formCekStok: (context) => FormCekStokScreen(
        data: ModalRoute.of(context)?.settings.arguments as Map<String, String>,
      ),
    };
  }
}
