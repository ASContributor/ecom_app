// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'intro_bloc.dart';

@immutable
sealed class IntroEvent {
  int index;
  IntroEvent({
    required this.index,
  });
}

class IntroInitial extends IntroEvent {
  IntroInitial({required super.index});
}
