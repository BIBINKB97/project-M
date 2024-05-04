import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project_m/model/valve_model.dart';

class ValveProviderClass with ChangeNotifier {

List <ValveModel> valveList =[];

Future<void> addNewValve(ValveModel value, int motorIndex) async {
  final valveDb = await Hive.openBox<ValveModel>('ValveDB');
  final id = await valveDb.add(value);
  value.id = id;
  valveList.add(value); 
  notifyListeners();
}

Future<void> getAllValves() async {
  final valveDb = await Hive.openBox<ValveModel>('ValveDB');
  valveList.clear();
  valveList.addAll(valveDb.values);
  notifyListeners();
}

Future<void> deleteData(int id) async {
  final valveDb = await Hive.openBox<ValveModel>('ValveDB');
  await valveDb.deleteAt(id);
  getAllValves();
}

Future<void> updateData(ValveModel model) async {
  final valveDb = await Hive.openBox<ValveModel>('ValveDB');
  await valveDb.put(model.id, model);
  getAllValves();
}

}