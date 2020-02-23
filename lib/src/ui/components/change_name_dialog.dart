import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void changeNameDialog(BuildContext context, Box<Brew> box, int index) {
  TextEditingController _textController = TextEditingController();
  _textController.text = box.getAt(index).name;
  final _formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Change name'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Form(
              key: _formKey,
              child: TextFormField(
                  maxLength: 25,
                  autocorrect: false,
                  autofocus: true,
                  controller: _textController,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Choose a new name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  }),
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
            if (_formKey.currentState.validate()) {
              Navigator.of(context).pop();
              Functions.updateBrewName(box, index, _textController.text);
            }
          },
        ),
      ],
    ),
  );
}
