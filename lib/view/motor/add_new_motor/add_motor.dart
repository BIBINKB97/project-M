import 'package:flutter/material.dart';
import 'package:project_m/controller/motor_controller.dart';
import 'package:project_m/models/motor_model/motor_model.dart';
import 'package:project_m/utils/utils.dart';
import 'package:project_m/view/motor/motor_list_screen/motor_list.dart';
import 'package:project_m/view/motor/motor_list_screen/widgets/textform_field.dart';
import 'package:project_m/view/widgets/text_style.dart';

class AddNewMotor extends StatefulWidget {
  const AddNewMotor({super.key});

  @override
  State<AddNewMotor> createState() => _AddNewMotorState();
}

class _AddNewMotorState extends State<AddNewMotor> {
   final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: CustomText(
          text: "Add new Motor",
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
    final motor = MotorModel(
      motorName: name,
    );
    addMotor(motor);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration:Duration(seconds: 1),
      content: Center(child: Text('Motor Added Successfully !')),
      margin: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
    ));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return  MotorListScreen();
    }));
  }
}