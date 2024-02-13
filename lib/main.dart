import 'package:ecom_app/Logic/LoginBloc/login_bloc.dart';
import 'package:ecom_app/common/CTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:ecom_app/View/route_management/route.dart';
import 'package:ecom_app/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: MaterialApp(
          themeMode: ThemeMode.system,
          title: 'Flutter Demo',
          theme: CTheme.LightRheme,
          darkTheme: CTheme.DarkTheam,
          initialRoute: AppRoute.intro_screen,
          onGenerateRoute: AppRoute.OnGenerateRoute,
        ),
      ),
    );
  }
}
