import 'package:flutter/material.dart';
import 'package:project_m/controller/valve_controller.dart';
import 'package:project_m/models/valve_model/valve_model.dart';
import 'package:project_m/utils/utils.dart';
import 'package:project_m/view/valve/valves_list/valve_list.dart';
import 'package:project_m/view/motor/motor_list_screen/widgets/textform_field.dart';
import 'package:project_m/view/widgets/text_style.dart';

class AddNewValveScreen extends StatefulWidget {
  const AddNewValveScreen({super.key});

  @override
  State<AddNewValveScreen> createState() => _AddNewValveScreenState();
}

class _AddNewValveScreenState extends State<AddNewValveScreen> {
   final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: CustomText(
          text: "Add new Valve",
          fs: 25,
          fw: FontWeight.w700,
          color: kblack,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 200,
          width: double.infinity,
          child: Column(
            children: [
              TextForm(
                    maxLength: 50,
                  keyboardtype: TextInputType.name,
                        controller: _nameController,
                    hintTxt: 'Enter name',
                  ),
                  ElevatedButton(onPressed: (){
                    onSaveButton();
                  }, child: CustomText(text: "Save"))
            ],
          ),
        ),
      ),
    );
  }
   Future<void> onSaveButton() async {
    final name = _nameController.text.trim();
    if (name.isEmpty){
      return;
    }
    final valve = ValveModel(
      valveName: name,
    );
    addValve(valve);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration:Duration(seconds: 1),
      content: Center(child: Text('Valve Added Successfully !')),
      margin: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
    ));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return  ValveListScreen();
    }));
  }
}