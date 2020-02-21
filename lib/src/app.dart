import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/providers/provider.dart';
import 'package:alebrew/src/ui/main_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class Alebrew extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlebrewState();
}

class _AlebrewState extends State<Alebrew> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BrewProvider>(
      create: (_) => BrewProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: FutureBuilder(
          future: Hive.openBox<Brew>('Brewery'),
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
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}