import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/providers/provider.dart';
import 'package:alebrew/src/ui/components/show_brew_modal.dart';
import 'package:alebrew/src/ui/components/show_trash_modal.dart';
import 'package:alebrew/src/ui/pages/brew_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

Widget brewListItem(BuildContext context, Box<Brew> box, int index,
    [bool isTrash = false]) {
  BrewProvider provider = Provider.of<BrewProvider>(context);

  return Material(
    color: Colors.white,
    child: InkWell(
      onTap: () => (isTrash)
          ? showTrashModal(context, box, index)
          : Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => BrewPage(
                  brew: box.getAt(index),
                ),
              ),
            ),
      onLongPress: () => (isTrash) ? null : showBrewModal(context, box, index),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Text(
                    box.getAt(index).name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 25),
                Text(
                  box.getAt(index).lastEdited,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
