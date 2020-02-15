import 'package:alebrew/src/ui/components/title.dart';
import 'package:alebrew/src/ui/pages/add_new_brew.dart';
import 'package:flutter/material.dart';

Widget noBrewPage(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      title("Alebrew", 50),
      SizedBox(height: 30),
      Text(
        "There is no brew page to show.\nWhy don't you try to create one?",
        style: TextStyle(
          fontSize: 20,
        )
      ),
      SizedBox(height: 30),
      SizedBox(
        width: 180,
        child: FlatButton(
          child: Row(
            children: <Widget>[
              ClipOval(
                child: Material(
                  color: Colors.black,
                  child: Icon(
                    Icons.add,
                    color: Colors.white
                  ),
                )
              ),
              SizedBox(width: 20),
              Text(
                "New Brew",
                style: TextStyle(
                  fontSize: 20,
                )
              ),
            ]
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewBrew()));
          }
        ),
      )
    ]
  );
}