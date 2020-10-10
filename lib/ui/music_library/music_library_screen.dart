import 'package:flutter/material.dart';

class MusicLibraryScreen extends StatelessWidget {
  final int number;

  MusicLibraryScreen({this.number}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My number is: $number'),
      ),
    );
  }
}
