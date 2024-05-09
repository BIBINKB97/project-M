import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_m/model/number_model/number_model.dart';
import 'package:project_m/model/valve_model/valve_model.dart';
import 'package:project_m/providers/receiver_provider.dart';
import 'package:project_m/providers/valve_provider.dart';
import 'package:project_m/view/get_numbers.dart';
import 'package:project_m/view/motorlist.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(ValveModelAdapter().typeId)){
    Hive.registerAdapter(ValveModelAdapter());
  }
  if(!Hive.isAdapterRegistered(NumberModelAdapter().typeId)){
    Hive.registerAdapter(NumberModelAdapter());
  }


final numberDB = await Hive.openBox<NumberModel>('numberDB');
  final hasNumber = numberDB.isNotEmpty;


  runApp(MyApp(hasNumber: hasNumber,));
}

class MyApp extends StatelessWidget {
  final bool hasNumber;
  const MyApp({super.key, required this.hasNumber});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
providers: [
  ChangeNotifierProvider(create: (context) => ValveProviderClass(),),
   ChangeNotifierProvider(create: (context) => ReceiverProviderClass(),)
  ],
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
       home: hasNumber? MotorListPage(): GetNumber(),
      ),
    );
  }
}



