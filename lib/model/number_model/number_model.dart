import 'package:hive_flutter/hive_flutter.dart';
    part 'number_model.g.dart';
@HiveType(typeId: 2)
class NumberModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final int? number;
 
  NumberModel({
    this.id,
    required this.number,
  });
}
