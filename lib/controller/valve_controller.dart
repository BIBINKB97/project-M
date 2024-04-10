import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project_m/models/valve_model/valve_model.dart';

ValueNotifier<List<ValveModel>> valveListNotifier = ValueNotifier([]);

Future<void> addValve(ValveModel value) async {
  final valveDb = await Hive.openBox<ValveModel>('VDB');
  final id = await valveDb.add(value);
  value.id = id;
}

Future<void> getAllvalves() async {
  final valveDb = await Hive.openBox<ValveModel>('VDB');
  valveListNotifier.value.clear();
  valveListNotifier.value.addAll(valveDb.values);
  valveListNotifier.notifyListeners();
}

Future<void> deleteValve(int id) async {
  final valveDb = await Hive.openBox<ValveModel>('VDB');
  await valveDb.deleteAt(id);
  getAllvalves();
}

Future<void> updateData(ValveModel model) async {
  final valveDb = await Hive.openBox<ValveModel>('VDB');
  await valveDb.put(model.id, model);
}
