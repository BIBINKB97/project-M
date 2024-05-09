// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NumberModelAdapter extends TypeAdapter<NumberModel> {
  @override
  final int typeId = 2;

  @override
  NumberModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NumberModel(
      id: fields[0] as int?,
      number: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, NumberModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NumberModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
