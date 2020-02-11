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
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box('data').listenable(),
        builder: (context, box, widget) {
          return Switch(
            value: box.get('darkMode'),
            onChanged: (val) {
              box.put('darkMode', val);
            }
          );
        },
      ),
    );
  }

}