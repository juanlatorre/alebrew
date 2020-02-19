import 'package:alebrew/src/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void showBrewModal(BuildContext context, Box<Brew> box, int index) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      height: 200,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
              box.getAt(index).name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.edit),
                    Text("Edit")
                  ],
                ),
                onPressed: () {}
              ),
              FlatButton(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.delete),
                    Text("Delete")
                  ],
                ),
                onPressed: () {}
              )
            ],
          )
        ],
      ),
    ),
  );
}