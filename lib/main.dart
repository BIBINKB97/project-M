import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_m/model/number_model/number_model.dart';
import 'package:project_m/model/valve_model/valve_model.dart';
import 'package:project_m/providers/receiver_provider.dart';
import 'package:project_m/providers/valve_provider.dart';
import 'package:project_m/view/get_numbers_page.dart';
import 'package:project_m/view/motorlist_page.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ValveModelAdapter().typeId)) {
    Hive.registerAdapter(ValveModelAdapter());
  }
  if (!Hive.isAdapterRegistered(NumberModelAdapter().typeId)) {
    Hive.registerAdapter(NumberModelAdapter());
  }

  final numberDB = await Hive.openBox<NumberModel>('numberDB');
  final hasNumber = numberDB.isNotEmpty;

  final receiverProvider = ReceiverProviderClass();
  await receiverProvider.getNumber();

  runApp(MyApp(
    hasNumber: hasNumber,
    receiverProvider: receiverProvider,
  ));
}

class MyApp extends StatelessWidget {
  final bool hasNumber;
  final ReceiverProviderClass receiverProvider;

  const MyApp({Key? key, 
  required this.hasNumber, 
  required this.receiverProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ValveProviderClass()),
        ChangeNotifierProvider.value(value: receiverProvider), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: hasNumber
            ? FutureBuilder(
                future: receiverProvider.getNumber(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return MotorListPage();
                  } else {
                    return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              )
            : GetNumber(),
      ),
    );
  }
}
