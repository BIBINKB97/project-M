import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_m/model/number_model/number_model.dart';
class ReceiverProviderClass with ChangeNotifier {

  NumberModel? motorNO;

  Future<void> addNumber(NumberModel number) async {
    final numberDB = await Hive.openBox<NumberModel>('numberDB');
    final id = await numberDB.add(number);
    number.id = id;
    motorNO = number; 
    notifyListeners();
  }
 
Future<void> getNumber() async {
  final numberDB = await Hive.openBox<NumberModel>('numberDB');
  motorNO = numberDB.values.firstOrNull; 
  notifyListeners();
}

}