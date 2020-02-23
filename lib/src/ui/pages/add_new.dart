import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/components/appbar.dart';
import 'package:alebrew/src/ui/components/drawer.dart';
import 'package:alebrew/src/ui/components/title.dart';
import 'package:alebrew/src/ui/main_view.dart';
import 'package:alebrew/src/utils/functions.dart';
import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  final Brew brew;

  AddNew({Key key, this.brew}) : super(key: key);

  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  Brew brew;

  @override
  void initState() {
    brew = widget.brew;
    super.initState();
  }

  String _getTitle() {
    return brew == null ? "Brew" : "Batch";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("New ${_getTitle()}"),
      drawer: drawer(context),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            title("Insert your ${_getTitle()} Name", 30),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      maxLength: 25,
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
                        child: Text("ADD",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // TODO: Add different action for Brew and Batch
                            Functions.addBrewToDatabase(
                                _textController.text, true);
                            FocusScope.of(context).unfocus();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => MainView(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
