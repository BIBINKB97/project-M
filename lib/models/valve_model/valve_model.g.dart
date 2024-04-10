// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valve_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ValveModelAdapter extends TypeAdapter<ValveModel> {
  @override
  final int typeId = 2;

  @override
  ValveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ValveModel(
      id: fields[0] as int?,
      valveName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ValveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.valveName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
