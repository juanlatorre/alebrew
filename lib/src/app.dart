import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/main_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Alebrew extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlebrewState();
}

class _AlebrewState extends State<Alebrew> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MainView()
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}