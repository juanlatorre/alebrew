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
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      (fields[3] as List)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Brew obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.brewPageName)
      ..writeByte(2)
      ..write(obj.brewPageLastEdited)
      ..writeByte(3)
      ..write(obj.brewPageList);
  }
}
