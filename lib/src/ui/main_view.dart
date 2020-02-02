import 'package:alebrew/src/blocs/navigation_bloc.dart';
import 'package:alebrew/src/ui/pages/brew_list.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
              accountEmail: Text("12345@gmail.com")),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
                NavigationDrawerBloc().updateNavigation("Home");
              },
            ),
            ListTile(
              title: Text("Page One"),
              onTap: () {
                Navigator.of(context).pop();
                NavigationDrawerBloc().updateNavigation("PageOne");
              },
            ),
            ListTile(
              title: Text("Page Two"),
              onTap: () {
                Navigator.of(context).pop();
                NavigationDrawerBloc().updateNavigation("PageTwo");
              },
            ),
          ],
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