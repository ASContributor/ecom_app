import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final PageController pageController = PageController();
  IntroBloc() : super(IntroState(page: 0)) {
    on<IntroInitial>((event, emit) {
      emit(IntroState(page: state.page));
    });
  }
}
