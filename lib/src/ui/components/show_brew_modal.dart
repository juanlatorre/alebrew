import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/components/change_name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void showBrewModal(BuildContext context, Box<Brew> box, int index) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only( 
        topLeft: Radius.circular(500),
        topRight: Radius.circular(500),
      ),
    ),
    context: context,
    builder: (context) => Container(
      height: 200,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30),
          Text(
              box.getAt(index).name,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              )
          ),
          SizedBox(height: 15),
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
                      )
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  changeNameDialog(context, box, index);
                }
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
                      )
                    )
                  ],
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  await Future.delayed(Duration(milliseconds: 300));
                  box.getAt(index).delete();
                }
              )
            ],
          )
        ],
      ),
    ),
  );
}