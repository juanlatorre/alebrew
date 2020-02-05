import 'package:alebrew/src/models/brew_model.dart';
import 'package:flutter/material.dart';
import 'package:alebrew/src/app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(BrewModelAdapter());
  runApp(Alebrew());
}