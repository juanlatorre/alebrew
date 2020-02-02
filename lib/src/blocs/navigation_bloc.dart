import 'dart:async';
import 'package:alebrew/src/resources/navigation_provider.dart';

class NavigationDrawerBloc {
  final StreamController navigationController = StreamController();
  NavigationProvider navigationProvider = NavigationProvider();

  Stream get getNavigation => navigationController.stream;

  void updateNavigation(String navigation) {
    navigationProvider.updateNavigation(navigation);
    navigationController.sink.add(navigationProvider.currentNavigation);
  }

  void dispose() {
    navigationController.close();
  }
}