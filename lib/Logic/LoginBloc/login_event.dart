part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginWithEmail extends LoginEvent {
  final String Email;
  final String Pass;

  final BuildContext context;
  LoginWithEmail(this.context, {required this.Email, required this.Pass});
}

class CheckStatusEvent extends LoginEvent {
  CheckStatusEvent();
}

class LoginWithGoogle extends LoginEvent {
  LoginWithGoogle();
}

class SignOut extends LoginEvent {
  SignOut();
}
