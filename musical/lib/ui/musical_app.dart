import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musical/blocs/botton_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:musical/ui/home_screen/home_screen.dart';
import 'package:musical/ui/music_library/music_library_screen.dart';
import 'package:musical/ui/widgets/curved_bottom_navigation.dart';
import 'package:musical/ui/widgets/hamburger_menu.dart';

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
          if (state is FirstPageLoaded) {
            return HomeScreen(text: state.text);
          }
          if (state is SecondPageLoaded) {
            return MusicLibraryScreen(number: state.number);
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
        return BottomNavigationBar(
          currentIndex: bottomNavigationBloc.currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              title: Text('First'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive, color: Colors.black),
              title: Text('Second'),
            ),
          ],
          onTap: (index) =>
              bottomNavigationBloc.add(PageTapped(pageIndex: index)),
        );
      }),
    ); //CurvedNavigation(),
  }

  @override
  void dispose() {
    super.dispose();
  }
}
