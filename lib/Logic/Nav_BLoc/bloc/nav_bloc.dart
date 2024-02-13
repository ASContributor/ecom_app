import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<OnTapEvent, NavState> {
  final PageController controller = PageController();
  NavBloc() : super(NavInitial(0)) {
    on<OnTapChangeEvent>((event, emit) {
      emit(NavInitial(event.currentTab));
    });
  }
}
