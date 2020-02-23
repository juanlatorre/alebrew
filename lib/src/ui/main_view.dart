import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/components/appbar.dart';
import 'package:alebrew/src/ui/components/drawer.dart';
import 'package:alebrew/src/ui/pages/brew_list.dart';
import 'package:alebrew/src/ui/pages/no_brew_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Home"),
      drawer: drawer(context),
      body: Container(
        width: double.infinity,
        child: Hive.box<Brew>('Brewery').values.isEmpty
            ? noBrewPage(context)
            : BrewList(),
      ),
    );
  }
}
