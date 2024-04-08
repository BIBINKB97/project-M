import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class MotorModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String motorName;
  MotorModel({
    this.id,
    required this.motorName,
  });
}
