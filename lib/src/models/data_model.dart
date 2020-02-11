import 'package:alebrew/src/models/brew_model.dart';
import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class DataModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  List<BrewModel> brewList;

  DataModel(
    this.id,
    this.brewList,
  );
}