import 'package:alebrew/src/ui/components/title.dart';
import 'package:flutter/material.dart';

import 'add_new_brew.dart';

Widget noBrewPage(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        title("Alebrew", 50),
        SizedBox(height: 30),
        Text("There is no brew page to show.\nWhy don't you try to create one?",
            style: TextStyle(
              fontSize: 20,
            )),
        SizedBox(height: 30),
        SizedBox(
          width: 180,
          child: FlatButton(
            child: Row(children: <Widget>[
              ClipOval(
                  child: Material(
                color: Colors.black,
                child: Icon(Icons.add, color: Colors.white),
              )),
              SizedBox(width: 20),
              Text("New Brew",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ]),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddNewBrew(),
                ),
              );
            },
          ),
        )
      ],
    ),
  );
}
