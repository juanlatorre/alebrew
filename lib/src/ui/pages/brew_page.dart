import 'package:alebrew/src/ui/components/arrow_down_button.dart';
import 'package:flutter/material.dart';

Widget brewPage(BuildContext context) {

  TextEditingController _searchController = TextEditingController();

  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(right: 40, left: 40, top: 50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "All",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ]
        ),
        SizedBox(height: 5),
        Container(
          height: 40,
          child: TextField(
            autofocus: false,
            autocorrect: false,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[100],
              hintText: "Search brew...",
              hintStyle: TextStyle(
                color: Colors.grey[600]
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            controller: _searchController,
            onSubmitted: (String value) async {
              // TODO: Erase this and implement actual search.
              await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thanks!'),
                    content: Text('You typed "$value".'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        SizedBox(height: 20),
        
      ]
    ),
  );
}