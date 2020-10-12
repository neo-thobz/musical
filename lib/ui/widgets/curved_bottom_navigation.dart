import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CurvedNavigation extends StatelessWidget {
  final int currentIndex;
  final void Function(int) buttonTapped;

  const CurvedNavigation({this.currentIndex, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: <Widget>[
        Icon(
          Icons.home,
          size: 20.0,
          color: Colors.black,
        ),
        Icon(
          Icons.library_music,
          size: 20.0,
          color: Colors.black,
        ),
        Icon(
          Icons.radio,
          size: 20.0,
          color: Colors.black,
        ),
        Icon(
          Icons.search,
          size: 20.0,
          color: Colors.black,
        ),
      ],
      height: 50.0,
      index: currentIndex,
      animationCurve: Curves.elasticInOut,
      animationDuration: Duration(milliseconds: 500),
      onTap: buttonTapped,
    );
  }
}
