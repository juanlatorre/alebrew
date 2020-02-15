import 'package:flutter/material.dart';

Widget appBar(String title) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
      title: Text(title, style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
  );
}