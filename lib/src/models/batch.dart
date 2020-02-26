import 'package:hive/hive.dart';

part 'batch.g.dart';

@HiveType(typeId: 1)
class Batch extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String status;
  @HiveField(2)
  String description;
  @HiveField(3)
  DateTime startDate;
  @HiveField(4)
  String size;
  @HiveField(5)
  String boilTime;
  @HiveField(6)
  double originalGravity;
  @HiveField(7)
  double finalGravity;
  @HiveField(8)
  int daysInWort;
  @HiveField(9)
  DateTime bottleDate;
  @HiveField(10)
  int bottleDaysAging;
  @HiveField(11)
  double bottleAbv;
  @HiveField(12)
  String ibu;
  @HiveField(13)
  String srm;
  @HiveField(14)
  String carbonationLevel;
  @HiveField(15)
  List<Map<String, int>> bottleCount = [];
  @HiveField(16)
  List<Map<String, dynamic>> recipe = [];

  Batch({
    this.name,
    this.status = "Waiting",
    this.description,
    this.startDate,
    this.size,
    this.boilTime,
    this.originalGravity,
    this.finalGravity,
    this.daysInWort,
    this.bottleDate,
    this.bottleDaysAging,
    this.bottleAbv,
    this.ibu,
    this.srm,
    this.carbonationLevel,
    this.bottleCount,
    this.recipe,
  });
}
