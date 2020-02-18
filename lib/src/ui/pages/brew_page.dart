import 'package:alebrew/src/ui/components/arrow_down_button.dart';
import 'package:alebrew/src/ui/pages/add_new_brew.dart';
import 'package:flutter/material.dart';

Widget brewPage(BuildContext context) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(right: 50, left: 50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "All",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  color: Colors.pink[200],
                  child: Text(
                    "New",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  onPressed: () {}
                ),
                SizedBox(width:1),
                ArrowDownButton(
                  onPressed: () {}
                )
              ]
            )
          ]
        ),
        SizedBox(height: 30),
        Text(
          "Wena",
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
    ),
  );
}