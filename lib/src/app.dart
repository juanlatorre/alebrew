import 'package:alebrew/src/ui/main_view.dart';
import 'package:flutter/material.dart';

class Alebrew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MainView(),
    );
  }
}