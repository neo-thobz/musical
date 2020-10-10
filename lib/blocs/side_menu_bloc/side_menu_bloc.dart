import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'side_menu_event.dart';
part 'side_menu_state.dart';

class SideMenuBloc extends Bloc<SideMenuEvent, SideMenuState> {
  SideMenuBloc() : super(SideMenuInitial());

  @override
  Stream<SideMenuState> mapEventToState(
    SideMenuEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
