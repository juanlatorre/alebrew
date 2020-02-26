import 'package:hive/hive.dart';

part 'brew.g.dart';

@HiveType(typeId: 0)
class Brew extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String lastEdited;
  @HiveField(2)
  List<dynamic> pageList;

  Brew(this.name, this.lastEdited, [this.pageList = const []]);
}
