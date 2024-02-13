import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/LoginBloc/login_bloc.dart';

class AuthStateListener extends StatelessWidget {
  final Widget child;

  AuthStateListener({required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is UnAuth) {
          // Navigate to login screen if unauthorized
          Navigator.pushNamedAndRemoveUntil(
              context, 'login/', (route) => false);
        }
        if (state is Auth) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
      },
      child: child,
    );
  }
}
