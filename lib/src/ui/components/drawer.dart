import 'package:alebrew/src/ui/components/drawer_tile.dart';
import 'package:alebrew/src/ui/main_view.dart';
import 'package:alebrew/src/ui/pages/add_new.dart';
import 'package:alebrew/src/ui/pages/trash.dart';
import 'package:flutter/material.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Alebrew',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          drawerTile(
            'New Brew',
            () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddNew(),
                ),
              );
            },
            lead: false,
            icon: Icons.add_circle,
          ),
          Divider(),
          drawerTile(
            'View All',
            () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MainView(),
                ),
              );
            },
            lead: false,
            icon: Icons.menu,
          ),
          Divider(),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Tools',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Divider(),
          drawerTile('Gravity', () {
            print('Gravity button clicked');
          }, lead: false),
          Divider(),
          drawerTile('Water', () {
            print('Water button clicked');
          }, lead: false),
          Divider(),
          drawerTile('Salts', () {
            print('Salts button clicked');
          }, lead: false),
          Divider(),
          drawerTile('Macerate', () {
            print('Macerate button clicked');
          }, lead: false),
          Divider(),
          drawerTile('IBUs', () {
            print('IBUs button clicked');
          }, lead: false),
          Divider(),
          drawerTile('Dilution', () {
            print('Dilution button clicked');
          }, lead: false),
          Divider(),
          drawerTile('ABV', () {
            print('ABV button clicked');
          }, lead: false),
          Divider(),
          drawerTile('Priming', () {
            print('Priming button clicked');
          }, lead: false),
          Divider(),
          drawerTile('Force Carbonate', () {
            print('Force Carbonate button clicked');
          }, lead: false),
          Divider(),
          SizedBox(height: 25),
          drawerTile('Settings', () {}, lead: true, icon: Icons.settings),
          drawerTile(
            'Trash',
            () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Trash(),
                ),
              );
            },
            lead: true,
            icon: Icons.delete,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Version 1.0.0 - Brown Ale',
                style: TextStyle(
                  color: Colors.pink[200],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
