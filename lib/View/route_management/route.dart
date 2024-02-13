import 'package:ecom_app/Logic/LoginBloc/login_bloc.dart';
import 'package:ecom_app/Logic/introBloc/intro_bloc.dart';
import 'package:ecom_app/View/custom_screen/auth_screen/login_screen.dart';
import 'package:ecom_app/View/custom_screen/feature_screen/intro_screen.dart';
import 'package:ecom_app/View/custom_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/Nav_BLoc/bloc/nav_bloc.dart';
import '../custom_screen/dashboard/landing_page.dart';
import '../uitilities/auth_listener.dart';

class AppRoute {
  static const String home = '/';
  static const String intro_screen = 'intro/';
  static const String splash_screen = 'splash/';
  static const String login_screen = 'login/';

  static Route<dynamic> OnGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case intro_screen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => IntroBloc(),
            child: const InfoScreen(),
          ),
        );
      case splash_screen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case login_screen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginScreen(),
          ),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NavBloc(),
              ),
              // BlocProvider(
              //   create: (context) => LoginBloc(),
              // ),
            ],
            child: AuthStateListener(child: const LandingPage()),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const LandingPage(),
        );
    }
  }
}
