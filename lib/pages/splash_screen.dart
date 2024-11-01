import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/footer_text.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(child: LogoWidget()),
            ),
            FooterText(),
          ],
        ),
      ),
    );
  }
}
