import 'package:flutter/material.dart';
import 'package:project_m/controller/motor_controller.dart';
import 'package:project_m/model/motor_model.dart';
import 'package:project_m/view/home_screen/home_screen.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
    final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
           showDialog(
                             context: context,
                             builder: (BuildContext context) {
                               return AlertDialog(
                                 title: Text(
                              'Add New Motor !',
                              style: TextStyle(color: Colors.red,fontSize: 20),
                            ),
                          content: Text(
                            'Do you want to Add a new Motor ?',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () {
                                 showDialog(
                               context: context,
                               builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Add New Motor !',
                               style: TextStyle(color: Colors.red,fontSize: 20),
                             ),
                                content: TextFormField(
                               controller: _nameController,
                               decoration: InputDecoration(
                                 hintText: "Enter name",
                                  border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(15),
                             )
                               ),
                                ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Save'),
                              onPressed: () {
                                onSaveButton();
                                Navigator.pop(context);
                                },
                                ),
                              ],
                              );
                             },
                           );    
                         },
                        ),
                      ],
                    );
                   },
                    );
      },
      child: Icon(Icons.add),
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
      content: Center(child: Text('Motor Added Successfully !')),
      margin: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
    ));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return  HomeScreen();
    }));
  }
}
