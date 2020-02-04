import 'package:alebrew/src/blocs/navigation_bloc.dart';
import 'package:alebrew/src/resources/get_information.dart';
import 'package:alebrew/src/ui/components/drawer_tile.dart';
import 'package:alebrew/src/ui/pages/brew_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:package_info/package_info.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
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
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.search)
                      ),
                      splashColor: Colors.pink[200],
                      onTap: () {
                        print('Search button clicked');
                      },  
                    )
                  ],
                ),
              ),
              Divider(),
              drawerTile(
                'New Brew',
                () {
                  print('New Brew button clicked');
                },
                false,
                Icons.add_circle
              ),
              Divider(),
              drawerTile(
                'View All',
                () {
                  print('View All button clicked');
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
                  print('Trash button clicked');
                  // FIXME
                  print(getVersion().toString());
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
              // ListTile(
              //   title: Text("Page One"),
              //   onTap: () {
              //     Navigator.of(context).pop();
              //     NavigationDrawerBloc().updateNavigation("PageOne");
              //   },
              // ),
              // ListTile(
              //   title: Text("Page Two"),
              //   onTap: () {
              //     Navigator.of(context).pop();
              //     NavigationDrawerBloc().updateNavigation("PageTwo");
              //   },
              // ),
            ],
          ),
        )
      ),
      body: StreamBuilder(
        stream: NavigationDrawerBloc().getNavigation,
        initialData: NavigationDrawerBloc().navigationProvider.currentNavigation,
        builder: (context, snapshot) {
          switch (NavigationDrawerBloc().navigationProvider.currentNavigation) {
            case ('Brew List'):
              return BrewList();
            default:
              return BrewList();
          }
        }
      )
    );
  }
}