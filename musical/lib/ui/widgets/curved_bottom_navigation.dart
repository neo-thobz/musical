import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CurvedNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: <Widget>[
        Icon(
          Icons.verified_user,
          size: 20.0,
          color: Colors.black,
        ),
        Icon(
          Icons.add,
          size: 20.0,
          color: Colors.black,
        ),
        Icon(
          Icons.list,
          size: 20.0,
          color: Colors.black,
        ),
      ],
      height: 50.0,
      animationCurve: Curves.elasticInOut,
      animationDuration: Duration(milliseconds: 500),
      onTap: (value) => {
        debugPrint('Pressed index: $value'),
      },
    );
  }
}
