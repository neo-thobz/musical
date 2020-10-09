import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(PageLoading());
  int currentIndex = 0;

  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    if (event is AppStarted) {
      this.add(PageTapped(pageIndex: this.currentIndex));
    }

    if (event is PageTapped) {
      this.currentIndex = event.pageIndex;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      switch (this.currentIndex) {
        case 0:
          yield FirstPageLoaded(text: 'this is some text');
          break;
        case 1:
          yield SecondPageLoaded(number: 9);
          break;
        case 2:
          yield ThirdPageLoaded(greeting: 'hello');
          break;
        default:
      }
    }
  }
}
