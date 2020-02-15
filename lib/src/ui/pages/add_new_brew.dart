import 'package:alebrew/src/ui/components/appbar.dart';
import 'package:alebrew/src/ui/components/title.dart';
import 'package:flutter/material.dart';

class AddNewBrew extends StatefulWidget {
  AddNewBrew({Key key}) : super(key: key);

  @override
  _AddNewBrewState createState() => _AddNewBrewState();
}

class _AddNewBrewState extends State<AddNewBrew> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("New Brew | Alebrew"),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            title("Insert your Brew Name", 30),
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autocorrect: false,
                    autofocus: true,
                    controller: _textController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ],
              )
            )
          ]
        )),
    );
  }
}