part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class BottomNavigationBlocInitial extends BottomNavigationState {}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChanged({@required this.currentIndex});

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class HomePageLoaded extends BottomNavigationState {
  final String text;

  HomePageLoaded({@required this.text});

  @override
  String toString() => 'FirstPageLoaded with text: $text';
}

class MusicLibraryLoaded extends BottomNavigationState {
  final int number;

  MusicLibraryLoaded({@required this.number});

  @override
  String toString() => 'SecondPageLoaded with number: $number';
}

class ThirdPageLoaded extends BottomNavigationState {
  final String greeting;

  ThirdPageLoaded({@required this.greeting});

  @override
  String toString() => 'ThirdPageLoaded with value: $greeting';
}
