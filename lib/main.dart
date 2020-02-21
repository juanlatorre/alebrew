import 'package:alebrew/src/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:alebrew/src/app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BrewAdapter());
  runApp(Alebrew());
}
