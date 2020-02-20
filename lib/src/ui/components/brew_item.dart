import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/components/show_brew_modal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Widget brewListItem(BuildContext context, Box<Brew> box, int index) {
  return Material(
    color: Colors.white,
    child: InkWell(
      onTap: () {},
      onLongPress: () => showBrewModal(context, box, index),
      child: Column(
        children: <Widget>[
          // if (index == 0)
          //   Divider(
          //     height: 1,
          //     color: Colors.black,
          //   ),
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
          // if (index == box.values.length - 1)
          //   Divider(
          //     height: 1,
          //     color: Colors.black,
          //   ),
        ]
      ),
    ),
  );
}