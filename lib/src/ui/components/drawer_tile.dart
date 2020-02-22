import 'package:alebrew/src/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Widget drawerTile(String title, Function callback, {bool lead, IconData icon}) {
  String _getNumberOfElementsInTrash() {
    int _elementNumber = Hive.box<Brew>("Trash").values.length;

    return _elementNumber != 0 ? " (${_elementNumber.toString()})" : "";
  }

  return ListTile(
    dense: true,
    title: Row(
      children: <Widget>[
        if (icon != null)
          Row(
            children: <Widget>[
              lead == true ? Icon(icon, color: Colors.grey[400]) : Icon(icon),
              SizedBox(width: 10),
            ],
          ),
        lead == true
            ? Text(
                title == "Trash"
                    ? title + _getNumberOfElementsInTrash()
                    : title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[400],
                ),
              )
            : Text(
                title,
                style: TextStyle(fontSize: 20),
              )
      ],
    ),
    onTap: callback,
  );
}
