import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project_m/models/motor_model/motor_model.dart';

ValueNotifier<List<MotorModel>> motorListNotifier = ValueNotifier([]);


Future<void> addMotor(MotorModel value) async {
  final motorDb = await Hive.openBox<MotorModel>('MDB');
  final id = await motorDb.add(value);
  value.id = id;
}

Future<void> getAllMotors() async {
  final motorDb = await Hive.openBox<MotorModel>('MDB');
  motorListNotifier.value.clear();
  motorListNotifier.value.addAll(motorDb.values);
  motorListNotifier.notifyListeners();

}

Future<void> deleteData(int id) async {
  final motorDb = await Hive.openBox<MotorModel>('MDB');
  await motorDb.deleteAt(id);
    motorListNotifier.value.clear();
  getAllMotors();

}

Future<void> updateData(MotorModel model) async {
  final motorDb = await Hive.openBox<MotorModel>('MDB');
  await motorDb.put(model.id, model);
}
