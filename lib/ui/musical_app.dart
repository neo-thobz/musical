import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musical/blocs/botton_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:musical/ui/home_screen/home_screen.dart';
import 'package:musical/ui/music_library/music_library_screen.dart';
import 'package:musical/ui/widgets/curved_bottom_navigation.dart';
import 'package:musical/ui/widgets/hamburger_menu.dart';

import '../blocs/botton_navigation_bloc/bottom_navigation_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bottomNavigationBloc =
        BlocProvider.of<BottomNavigationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: HamburgerMenu(),
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HomePageLoaded) {
            return HomeScreen(text: state.text);
          }
          if (state is MusicLibraryLoaded) {
            return MusicLibraryScreen(number: state.number);
          }
          if (state is ThirdPageLoaded) {
            return Center(
              child: Text(state.greeting),
            );
          }
          return Container(
            child: Center(
              child: Text(
                'What a fail!',
              ),
            ),
          );
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (BuildContext context, BottomNavigationState state) {
        return CurvedNavigation(
          currentIndex: bottomNavigationBloc.currentIndex,
          buttonTapped: (index) => bottomNavigationBloc.add(
            PageTapped(
              pageIndex: index,
            ),
          ),
        );
      }),
    ); //CurvedNavigation(),
  }

  @override
  void dispose() {
    super.dispose();
  }
}
