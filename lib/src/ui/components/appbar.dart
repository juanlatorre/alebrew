import 'package:flutter/material.dart';

Widget appBar(String title) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    title: Text(title, style: TextStyle(color: Colors.black)),
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
