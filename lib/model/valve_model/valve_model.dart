import 'package:hive/hive.dart';
part 'valve_model.g.dart';
@HiveType(typeId: 1)
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
