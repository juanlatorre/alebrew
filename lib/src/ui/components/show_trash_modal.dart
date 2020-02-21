import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/providers/provider.dart';
import 'package:alebrew/src/ui/components/change_name_dialog.dart';
import 'package:alebrew/src/ui/components/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

void showTrashModal(BuildContext context, Box<Brew> box, int index) {
  final provider = Provider.of<BrewProvider>(context, listen: false);

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
                      Icons.undo,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Undo",
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
                provider.restoreBrew(box, index);
              },
            ),
            SizedBox(width: 24),
            FlatButton(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.delete_forever,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Clean",
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
                provider.permanentDeleteBrew(box, index);
              },
            )
          ],
        )
      ],
    ),
  );
}
