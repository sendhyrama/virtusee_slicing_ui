import 'package:flutter/material.dart';
import '../utils/status_bar.dart';
import '../widgets/logo_widget.dart';
import '../widgets/footer_text.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);

    _initializeApp();
  }

  Future<void> _initializeApp() async {
    _fadeController.forward();

    await Future.delayed(const Duration(seconds: 4));

    if (mounted) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatusBar.setLightStatusBar();
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: const Padding(
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
      ),
    );
  }
}
