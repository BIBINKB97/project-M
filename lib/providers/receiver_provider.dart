import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_m/model/number_model/number_model.dart';
class ReceiverProviderClass with ChangeNotifier {

  NumberModel? motorNumber ;

  Future<void> addNumber(NumberModel number) async {
    final numberDB = await Hive.openBox<NumberModel>('numberDB');
    final id = await numberDB.add(number);
    number.id = id;
    motorNumber  = number; 
    notifyListeners();
  }
 
Future <void> getNumber( ) async {
  final numberDB = await Hive.openBox<NumberModel>('numberDB');
  motorNumber  = numberDB.values.firstOrNull; 
  notifyListeners();
}
}