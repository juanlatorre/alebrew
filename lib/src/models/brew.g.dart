// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brew.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BrewAdapter extends TypeAdapter<Brew> {
  @override
  final typeId = 0;

  @override
  Brew read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Brew(
      name: fields[0] as String,
      lastEdited: fields[1] as String,
      pageList: (fields[2] as List)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Brew obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.lastEdited)
      ..writeByte(2)
      ..write(obj.pageList);
  }
}
