// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MotorModelAdapter extends TypeAdapter<MotorModel> {
  @override
  final int typeId = 1;

  @override
  MotorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MotorModel(
      id: fields[0] as int?,
      motorName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MotorModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.motorName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MotorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
