import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial());

  @override
  Stream<NavbarState> mapEventToState(
    NavbarEvent event,
  ) async* {
    if (event is ChangeNavEvent) {
      yield NavbarLoading();
    }
  }
}
