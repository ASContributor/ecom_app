part of 'nav_bloc.dart';

@immutable
sealed class NavState {}

final class NavInitial extends NavState {
  final int activeTab;

  NavInitial(this.activeTab);
}
