// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leveling.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LevelingAdapter extends TypeAdapter<Leveling> {
  @override
  final int typeId = 2;

  @override
  Leveling read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Leveling(
      configer: fields[3] as int,
    )
      .._level = fields[0] as int
      .._exp = fields[1] as int
      .._levelUpExp = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, Leveling obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj._level)
      ..writeByte(1)
      ..write(obj._exp)
      ..writeByte(2)
      ..write(obj._levelUpExp)
      ..writeByte(3)
      ..write(obj.configer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevelingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
