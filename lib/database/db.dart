// // ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:project_m/model/valve_model.dart';

// ValueNotifier<List<ValveModel>> valveListNotifier = ValueNotifier([]);

// Future<void> addNewValve(ValveModel value, int motorIndex) async {
//   final valveDb = await Hive.openBox<ValveModel>('ValveDB');
//   final id = await valveDb.add(value);
//   value.id = id;
//   valveListNotifier.value.add(value); 
//   valveListNotifier.notifyListeners();
// }


// Future<void> getAllValves() async {
//   final valveDb = await Hive.openBox<ValveModel>('ValveDB');
//   valveListNotifier.value.clear();
//   valveListNotifier.value.addAll(valveDb.values);
//   valveListNotifier.notifyListeners();
// }

// Future<void> deleteData(int id) async {
//   final valveDb = await Hive.openBox<ValveModel>('ValveDB');
//   await valveDb.deleteAt(id);
//   getAllValves();
// }

// Future<void> updateData(ValveModel model) async {
//   final valveDb = await Hive.openBox<ValveModel>('ValveDB');
//   await valveDb.put(model.id, model);
//   valveListNotifier.value.add(model);
//     valveListNotifier.notifyListeners();
// }
