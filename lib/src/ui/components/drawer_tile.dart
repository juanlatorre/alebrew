import 'package:flutter/material.dart';

Widget drawerTile(String title, Function callback, bool lead, [IconData icon]) {
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
          lead == true ? Text(title, style: TextStyle(fontSize: 20, color: Colors.grey[400])) : Text(title, style: TextStyle(fontSize: 20))
      ],
    ),
    onTap: callback,
  );
}