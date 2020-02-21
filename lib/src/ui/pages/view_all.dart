import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/pages/brew_page.dart';
import 'package:alebrew/src/ui/pages/no_brew_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ViewAll extends StatefulWidget {
  @override
  _ViewAllState createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Hive.box<Brew>('Brewery').values.isEmpty ? noBrewPage(context) : BrewPage()
    );
  }
}