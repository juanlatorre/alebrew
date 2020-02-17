import 'package:alebrew/src/models/brew.dart';
import 'package:hive/hive.dart';

part 'data.g.dart';

@HiveType(typeId: 1)
class Data extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  List<Brew> brewList;

  Data(
    this.id,
    this.brewList,
  );
}