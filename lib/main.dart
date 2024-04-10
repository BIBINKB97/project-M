import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_m/models/motor_model/motor_model.dart';
import 'package:project_m/models/valve_model/valve_model.dart';
import 'package:project_m/view/motor/motor_list_screen/motor_list.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(MotorModelAdapter().typeId)){
    Hive.registerAdapter(MotorModelAdapter());
  }
   if(!Hive.isAdapterRegistered(
    ValveModelAdapter().typeId)){
    Hive.registerAdapter(ValveModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sample app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MotorListScreen(),
       
      },     );
  }
}

