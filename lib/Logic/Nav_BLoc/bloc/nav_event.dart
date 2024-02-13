part of 'nav_bloc.dart';

@immutable
sealed class OnTapEvent {
  final int currentTab;

  const OnTapEvent({required this.currentTab});
}

class OnTapChangeEvent extends OnTapEvent {
  const OnTapChangeEvent({required super.currentTab});
}
