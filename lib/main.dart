import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musical/ui/musical_app.dart';

import 'blocs/botton_navigation_bloc/bottom_navigation_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc()
          ..add(
            AppStarted(),
          ),
        child: MyHomePage(title: 'Musical'),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
