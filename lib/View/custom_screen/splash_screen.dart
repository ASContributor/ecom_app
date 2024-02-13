import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool seen = false;
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    isFirstTime();
  }

  Future<void> isFirstTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      seen = (preferences.getBool('seen') ?? false);
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (seen) {
        Navigator.pushReplacementNamed(context, 'login/');
      } else {
        Navigator.pushReplacementNamed(context, 'intro/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Colors.black, Colors.red, Colors.white],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
