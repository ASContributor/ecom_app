import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../View/uitilities/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthFirebase _authFirebase = AuthFirebase();
  LoginBloc() : super(UnAuth()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginWithEmail) {
        await AuthFirebase().signInWithEmailandPassword(
            email: event.Email, password: event.Pass);
        if (_authFirebase.currentuser != null) {
          final String email = _authFirebase.currentuser!.email as String;

          emit(Auth(email: email, token: _authFirebase.currentuser!.uid));
          Navigator.pushNamedAndRemoveUntil(
              event.context, '/', (route) => false);
        } else {
          emit(UnAuth());
        }
      }
    });
    on<SignOut>((event, emit) async {
      await _authFirebase.signOut();
      emit(UnAuth());
    });
    on<CheckStatusEvent>((event, emit) async {
      if (_authFirebase.currentuser == null) {
        emit(UnAuth());
      } else {
        emit(Auth(
            email: _authFirebase.currentuser!.email,
            token: _authFirebase.currentuser!.uid));
      }
    });
  }
}
