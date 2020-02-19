import 'package:alebrew/src/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void changeNameDialog(BuildContext context, Box<Brew> box, int index) {
  TextEditingController _textController = TextEditingController();
  _textController.text = box.getAt(index).name;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Change name'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              autocorrect: false,
              autofocus: true,
              controller: _textController,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            box.getAt(index).name = _textController.text;
            box.getAt(index).save();
            Navigator.of(context).pop();
          },
        ),
      ],
    )    
  );
}