import 'package:flutter/material.dart';
import 'package:alebrew/src/ui/brew_list.dart';

class Alebrew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alebrew',
      theme: ThemeData.light(),
      home: Scaffold(
        body: BrewList(title: 'Alebrew'),
      )
    );
  }
}
