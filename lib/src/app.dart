import 'package:flutter/material.dart';
import 'package:alebrew/src/ui/brew_list.dart';

class Alebrew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alebrew',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: BrewList(title: 'Alebrew'),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                }
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                }
              )
            ],
          )
        ),
      )
    );
  }
}
