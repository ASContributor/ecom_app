import 'package:ecom_app/Logic/LoginBloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        print('objdfdfdect');
        print(BlocProvider.of<LoginBloc>(context).state);
        if (BlocProvider.of<LoginBloc>(context).state == Auth) {
          Navigator.pushReplacementNamed(context, '/');
        } else {
          Navigator.pushReplacementNamed(context, 'login/',arguments: (BlocProvider.of<LoginBloc>(context).state is UnAuth));
        }
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
