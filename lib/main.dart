import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_m/model/valve_model.dart';
import 'package:project_m/providers/valve_provider.dart';
import 'package:project_m/view/get_numbers.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(ValveModelAdapter().typeId)){
    Hive.registerAdapter(ValveModelAdapter());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
providers: [
  ChangeNotifierProvider(create: (context) => ValveProviderClass(),)],
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
       home: GetNumber(),
      ),
    );
  }
}



