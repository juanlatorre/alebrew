import 'package:flutter/material.dart';

Widget appBar(String title, {int level = 1}) {
  return AppBar(
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),
    title: Row(
      children: <Widget>[
        if (level == 2)
          Flexible(
            child: Text(
              "Home / ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    bottom: PreferredSize(
      child: Container(
        color: Colors.grey,
        height: 1,
      ),
      preferredSize: Size.fromHeight(1),
    ),
  );
}
