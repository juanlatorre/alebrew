import 'package:alebrew/src/resources/functions.dart';
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
            Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      autocorrect: false,
                      autofocus: true,
                      controller: _textController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 150,
                      child: OutlineButton(
                        color: Colors.grey[50],
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        textColor: Colors.black,
                        child: Text(
                          "ADD",
                          style: TextStyle(
                            fontSize: 20,
                          )
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Functions.addBrewToDatabase();
                            Navigator.pop(context);
                          }
                        },
                      )
                    )
                  ],
                )
              )
            )
          ]
        )),
    );
  }
}