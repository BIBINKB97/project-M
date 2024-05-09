import 'package:flutter/material.dart';
import 'package:project_m/model/valve_model/valve_model.dart';
import 'package:project_m/providers/valve_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditValve extends StatefulWidget {
   ValveModel model;
   EditValve({super.key,required this.model});
    final nameController = TextEditingController();

  @override
  State<EditValve> createState() => _EditValveState();
}

class _EditValveState extends State<EditValve> {
   @override
     void initState() {
    widget.nameController.text = widget.model.valveName;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
            title: Text('Edit Valve Name'),
            content: TextFormField(
             controller: widget.nameController,
             decoration: InputDecoration(hintText: 'Enter Valve Name'),
            ),
            actions: [
           TextButton(
             onPressed: () => Navigator.pop(context),
             child: Text('Cancel'),
            ),
           TextButton(
             onPressed: () {     
             onUpdateButton();
             Navigator.pop(context);
            },
               child: Text('Update'),
            ),
          ],
        );
  }
   Future<void> onUpdateButton() async {
    final name = widget.nameController.text.trim();
    if (name.isEmpty) {
      return;
    }
    final valve = ValveModel(
      id: widget.model.id,
      valveName: name,
    );
   Provider.of<ValveProviderClass>(
    context ,listen: false).updateData(valve);
  
   }
}