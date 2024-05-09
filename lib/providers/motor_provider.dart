// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MotorProviderClass extends ChangeNotifier {
//   final List<bool> _isMotorOnList = [false, false];
//   final Map<int, List<bool>> _valveStatusMap = {
//     1: [false, false],
//     2: [false, false],
//   };

//   int get motorCount => _isMotorOnList.length;

//   bool isMotorOn(int index) {
//     return _isMotorOnList[index];
//   }

//   Future<void> toggleMotorStatus(int index) async {
//     _isMotorOnList[index] = !_isMotorOnList[index];
   
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('motor_$index', _isMotorOnList[index]);
//      notifyListeners();
//   }

//   int getValveCountForMotor(int motorNo) {
//     return _valveStatusMap[motorNo]!.length;
//   }

//   bool isValveOpen(int motorNo, int valveIndex) {
//     return _valveStatusMap[motorNo]![valveIndex];
//   }

//   void toggleValveStatus(int motorNo, int valveIndex) {
//     _valveStatusMap[motorNo]![valveIndex] =
//         !_valveStatusMap[motorNo]![valveIndex];
//     notifyListeners();
//   }
// }
