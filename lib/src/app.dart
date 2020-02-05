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
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: FutureBuilder(
        future: Hive.openBox('brews'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return MainView();
            }
          } else {
            return Scaffold();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}