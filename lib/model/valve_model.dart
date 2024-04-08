import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class ValveModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String valveName;
  ValveModel({
    this.id,
    required this.valveName,
  });
}
