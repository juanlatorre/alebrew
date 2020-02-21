import 'package:alebrew/src/providers/provider.dart';
import 'package:alebrew/src/ui/components/appbar.dart';
import 'package:alebrew/src/ui/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<BrewProvider>(context);

    return Scaffold(
      appBar: appBar(navigation.getNavigationTitle),
      drawer: drawer(context),
      body: navigation.getNavigation,
    );
  }
}