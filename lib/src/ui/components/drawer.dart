import 'package:alebrew/src/providers/navigation_provider.dart';
import 'package:alebrew/src/ui/components/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget drawer(BuildContext context) {
  final navigation = Provider.of<NavigationProvider>(context);
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
              Navigator.of(context).pop();
              navigation.updateNavigation("New Brew");
            },
            false,
            Icons.add_circle
          ),
          Divider(),
          drawerTile(
            'View All',
            () {
              Navigator.of(context).pop();
              navigation.updateNavigation("View All");
            },
            false,
            Icons.menu
          ),
          Divider(),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tools',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
          ),
          Divider(),
          drawerTile(
            'Gravity',
            () {
              print('Gravity button clicked');
            },
            false
          ),
          Divider(),
          drawerTile(
            'Water',
            () {
              print('Water button clicked');
            },
            false
          ),
          Divider(),
          drawerTile(
            'Salts',
            () {
              print('Salts button clicked');
            },
            false
          ),
          Divider(),
          drawerTile(
            'Macerate',
            () {
              print('Macerate button clicked');
            },
            false
          ),
          Divider(),
          drawerTile(
            'IBUs',
            () {
              print('IBUs button clicked');
            },
            false
          ),
          Divider(),
          drawerTile(
            'Dilution',
            () {
              print('Dilution button clicked');
            },
            false
          ),
          Divider(),
          drawerTile(
            'ABV',
            () {
              print('ABV button clicked');
            },
            false
          ),
          Divider(),
          drawerTile(
            'Priming',
            () {
              print('Priming button clicked');
            },
            false
          ),
          Divider(),
          drawerTile(
            'Force Carbonate',
            () {
              print('Force Carbonate button clicked');
            },
            false
          ),
          Divider(),
          SizedBox(height: 25),
          drawerTile(
            'Settings',
            () {
              print('Settings button clicked');
            },
            true,
            Icons.settings
          ),
          drawerTile(
            'Trash',
            () {
              Navigator.of(context).pop();
            },
            true,
            Icons.delete
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Version 1.0.0 - Brown Ale',
                style: TextStyle(
                  color: Colors.pink[200],
                )
              )
            ),
          ),
        ],
      ),
    )
  );
}