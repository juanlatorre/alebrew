import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

void showClearTrashModal(BuildContext context, Box<Brew> box) {
  final provider = Provider.of<BrewProvider>(context, listen: false);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Clean Trash"),
        content: Text("All elements in trash will dissappear.\nContinue?"),
        actions: [
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                  "Yes",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  provider.cleanTrashCan();
                },
              ),
              Container(
                color: Colors.pink[200],
                child: FlatButton(
                  child: Text(
                    "No",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}
