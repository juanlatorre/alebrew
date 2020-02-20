import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/pages/brew_page.dart';
import 'package:alebrew/src/ui/pages/no_brew_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ViewAll extends StatefulWidget {
  @override
  _ViewAllState createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ValueListenableBuilder(
        valueListenable: Hive.box<Brew>('Brewery').listenable(),
        builder: (context, box, widget) {
          if (box.values.isEmpty) {
            return noBrewPage(context);
          } else {
            return BrewPage();
          }
        },
      ),
    );
  }
}