import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/components/arrow_down_button.dart';
import 'package:alebrew/src/ui/components/show_brew_modal.dart';
import 'package:alebrew/src/ui/pages/add_new_brew.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

Widget brewPage(BuildContext context) {

  TextEditingController _searchController = TextEditingController();

  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(right: 30, left: 30, top: 50),
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewBrew()));
                  }
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
        ValueListenableBuilder(
          valueListenable: Hive.box<Brew>("Brewery").listenable(keys: ['lista']),
          builder: (context, Box<Brew> box, _) {
            return Flexible(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(height: 1, color: Colors.black);
                },
                itemCount: box.values.length,
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {},
                      onLongPress: () => showBrewModal(context, box, index),
                      child: Column(
                        children: <Widget>[
                          if (index == 0)
                            Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    box.getAt(index).name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                ),
                                SizedBox(width: 25),
                                Text(
                                  box.getAt(index).lastEdited,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey
                                  )
                                ),
                              ],
                            ),
                          ),
                          if (index == box.values.length - 1)
                            Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                        ]
                      ),
                    ),
                  );
                },
              ),
            );
          }
        )
      ]
    ),
  );
}