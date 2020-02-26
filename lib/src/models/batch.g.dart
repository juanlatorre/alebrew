// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BatchAdapter extends TypeAdapter<Batch> {
  @override
  final typeId = 1;

  @override
  Batch read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Batch(
      name: fields[0] as String,
      status: fields[1] as String,
      description: fields[2] as String,
      startDate: fields[3] as DateTime,
      size: fields[4] as String,
      boilTime: fields[5] as String,
      originalGravity: fields[6] as double,
      finalGravity: fields[7] as double,
      daysInWort: fields[8] as int,
      bottleDate: fields[9] as DateTime,
      bottleDaysAging: fields[10] as int,
      bottleAbv: fields[11] as double,
      ibu: fields[12] as String,
      srm: fields[13] as String,
      carbonationLevel: fields[14] as String,
      bottleCount: (fields[15] as List)
          ?.map((dynamic e) => (e as Map)?.cast<String, int>())
          ?.toList(),
      recipe: (fields[16] as List)
          ?.map((dynamic e) => (e as Map)?.cast<String, dynamic>())
          ?.toList(),
    );
  }

  @override
  void write(BinaryWriter writer, Batch obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.startDate)
      ..writeByte(4)
      ..write(obj.size)
      ..writeByte(5)
      ..write(obj.boilTime)
      ..writeByte(6)
      ..write(obj.originalGravity)
      ..writeByte(7)
      ..write(obj.finalGravity)
      ..writeByte(8)
      ..write(obj.daysInWort)
      ..writeByte(9)
      ..write(obj.bottleDate)
      ..writeByte(10)
      ..write(obj.bottleDaysAging)
      ..writeByte(11)
      ..write(obj.bottleAbv)
      ..writeByte(12)
      ..write(obj.ibu)
      ..writeByte(13)
      ..write(obj.srm)
      ..writeByte(14)
      ..write(obj.carbonationLevel)
      ..writeByte(15)
      ..write(obj.bottleCount)
      ..writeByte(16)
      ..write(obj.recipe);
  }
}
