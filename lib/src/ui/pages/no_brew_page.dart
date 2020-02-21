import 'package:alebrew/src/providers/provider.dart';
import 'package:alebrew/src/ui/components/title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget noBrewPage(BuildContext context) {
  final navigation = Provider.of<BrewProvider>(context);
  return Container(
    color: Colors.white,
    child: Column(
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
              navigation.updateNavigation("New Brew");
            }
          ),
        )
      ]
    ),
  );
}