import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String text;

  HomeScreen({this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My text is: $text'),
      ),
    );
  }
}
