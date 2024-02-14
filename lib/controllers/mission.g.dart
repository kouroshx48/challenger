// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MissionAdapter extends TypeAdapter<Mission> {
  @override
  final int typeId = 5;

  @override
  Mission read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mission(
      name: fields[0] as String,
      expAmount: fields[1] as int,
      description: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Mission obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.expAmount)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MissionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
