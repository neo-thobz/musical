import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:musical/repo/home_page_repo.dart';
import 'package:musical/repo/music_library_repo.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final HomePageRepo homePageRepo;
  final MusicLibraryRepo musicLibraryRepo;
  int currentIndex = 0;

  BottomNavigationBloc(
      {@required this.homePageRepo, @required this.musicLibraryRepo})
      : super(PageLoading());

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
          String data = await _getHomePageData();
          yield HomePageLoaded(text: data);
          break;
        case 1:
          int data = await _getMusicLibraryData();
          yield MusicLibraryLoaded(number: data);
          break;
        case 2:
          yield ThirdPageLoaded(greeting: 'hello world!');
          break;
        default:
      }
    }
  }

  Future<String> _getHomePageData() async {
    String data = homePageRepo.data;
    if (data == null) {
      await homePageRepo.fetchData();
      data = homePageRepo.data;
    }
    return data;
  }

  Future<int> _getMusicLibraryData() async {
    int data = musicLibraryRepo.data;
    if (data == null) {
      await musicLibraryRepo.fetchData();
      data = musicLibraryRepo.data;
    }
    return data;
  }
}
