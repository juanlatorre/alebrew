import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/components/change_name_dialog.dart';
import 'package:alebrew/src/ui/components/custom_bottom_sheet.dart';
import 'package:alebrew/src/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void showBrewModal(BuildContext context, Box<Brew> box, int index) {
  customBottomSheet(
    context,
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 25),
        Flexible(
          child: Text(
            box.getAt(index).name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.edit,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Edit name",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
                changeNameDialog(context, box, index);
              },
            ),
            SizedBox(width: 24),
            FlatButton(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              onPressed: () async {
                Navigator.pop(context);
                await Future.delayed(Duration(milliseconds: 300));
                Functions.deleteBrew(box, index);
              },
            )
          ],
        )
      ],
    ),
  );
}
