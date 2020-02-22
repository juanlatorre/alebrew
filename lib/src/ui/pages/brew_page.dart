import 'package:alebrew/src/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BrewPage extends StatefulWidget {
  final Box<Brew> box;
  final int index;

  BrewPage({Key key, @required this.box, @required this.index})
      : super(key: key);

  @override
  _BrewPageState createState() => _BrewPageState();
}

class _BrewPageState extends State<BrewPage> {
  Box<Brew> box;
  int index;

  @override
  void initState() {
    box = widget.box;
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(box.getAt(index).name),
    );
  }
}
