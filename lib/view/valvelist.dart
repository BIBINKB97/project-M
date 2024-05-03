// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:project_m/database/db.dart';
import 'package:project_m/utils/utils.dart';
import 'package:project_m/view/widgets/custom_text.dart';
import 'package:telephony_sms/telephony_sms.dart';

class ValveList extends StatefulWidget {
   const ValveList({super.key,});
  @override
  _ValveListState createState() => _ValveListState();
}

class _ValveListState extends State<ValveList> {
    final _telephonySMS = TelephonySMS();
    List<String> valves = ['Valve 1', 'Valve 2', 'Valve 3'];
    List<bool> newValveList = List.generate(1000, (index) => false); 

  @override
  Widget build(BuildContext context) {  
    getAllValves();
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: 'Valves of Motor'),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(color: kAshLight,borderRadius: BorderRadius.circular(10)),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                  CustomText(text: "Valve List"),
                                            
                             ],
                            ),
                           ),
                         ),  
                         Expanded(
                           child: ListView.builder(
                             shrinkWrap: true,
                             itemCount: valves.length,
                             itemBuilder: (context, index) {
                               return
                             Container(
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                               child: Row( 
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      
                                       _editValveName(context, index);
                                    },
                                    onLongPress: () {
                                       _deleteValve(context, index);
                                    },
                                    child: Container(
                                     height: 80,
                                     width: 260,
                                     decoration: BoxDecoration(
                                     color: kgrey,
                                     borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                     ),
                                     child: Center(
                                     child: CustomText(
                                     text: valves[index],
                                     fs: 15,
                                     fw: FontWeight.w700,
                                     color: kwhite,
                                          ),
                                     ),
                                    ),
                                  ),
                                  kWidth2,
                                   GestureDetector(
                                   onTap: () async {
                                       setState(() {
                                         newValveList[index] = !newValveList[index];
                                       });
                                       await _telephonySMS.requestPermission();
                                       await _telephonySMS.sendSMS(
                                         phone: "gdfgd",
                                         message: "V${index + 1} ${newValveList[index] ? 'ON' : 'OFF'}",
                                       );
                                     },
                                     child: Container(
                                     height: 80,
                                     width: 100,
                                     decoration: BoxDecoration(
                                     color:newValveList[index]? kgreen : kred,
                                     borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                                     ),
                                     child: Center(
                                     child: CustomText(
                                     text:newValveList[index]? "ON" : "OFF",
                                     fs: 15,
                                     fw: FontWeight.w700,
                                     color: kwhite,
                                     )),
                                  ),
                                   ),
                                 ],
                               ),
                             );
                            },
                          ),
                        ),
                       ],
                     ),
                     Positioned(
                       bottom: 50.0,
                       right: 30.0,
                       child: FloatingActionButton(
                       onPressed: addValve,
                       tooltip: 'Add Valve',
                       child: Icon(Icons.add),
                       ),
                     ),
                   ],
                 ),
               );
             }
             void addValve() {
               showDialog(context: context, builder: (context) {
                 return AlertDialog(
                 title: Text('Add new Valve?'),
                 content: Text('Do you want to add a new valve?'),
                 actions: <Widget>[
                 TextButton(
                 child: Text('Cancel'),
                 onPressed: () {
                 Navigator.of(context).pop();
                 },
                ),
              TextButton(
                 child: Text('Add'),
                 onPressed: () {
                 setState(() {
                 valves.add('Valve ${valves.length + 1}');
                 });
                 Navigator.of(context).pop();
                 },
               ),
             ],
           );
         },
       ); 
     }

  void _editValveName(BuildContext context, int index) {
    TextEditingController controller = TextEditingController(text: valves[index]);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Edit Valve Name'),
            content: TextField(
            controller: controller,
            autofocus: true,
          ),
          actions: <Widget>[
               TextButton(
                child: Text('Save'),
                onPressed: () {
                setState(() {
                valves[index] = controller.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteValve(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Delete Valve?'),
            content: Text('Are you sure ? You want to delete this valve?'),
            actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
              Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: Text('Delete'),
                onPressed: () {
                setState(() {
                valves.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

