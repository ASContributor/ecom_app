part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class UnAuth extends LoginState {}

final class Auth extends LoginState {
  final String? email;

  final String token;
  Auth({this.email, required this.token});
}
