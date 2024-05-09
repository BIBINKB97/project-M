// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project_m/model/valve_model/valve_model.dart';
import 'package:project_m/providers/receiver_provider.dart';
import 'package:project_m/providers/valve_provider.dart';
import 'package:project_m/utils/utils.dart';
import 'package:project_m/view/edit_valve.dart';
import 'package:project_m/view/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';

class ValveList extends StatefulWidget {
  
  final int motorNo ;
   const ValveList({super.key,
   
    required this.motorNo,});
  @override

  _ValveListState createState() => _ValveListState();
}

class _ValveListState extends State<ValveList> {
   List<bool> newValveList = List.generate(1000, (index) => false); 
   TextEditingController nameController =TextEditingController();
   final Telephony telephony = Telephony.instance;

      @override
  void initState() {
    super.initState();
    _loadValveStatus();
  }

  void _loadValveStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < newValveList.length; i++) {
      bool isOpen = prefs.getBool('valve_$i') ?? false;
      setState(() {
        newValveList[i] = isOpen;
      });
    }
  }

  void saveValveStatus(int index, bool isOpen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('valve_$index', isOpen);
  }
    
  @override
  Widget build(BuildContext context) {  
       Provider.of<ValveProviderClass>(
       context,listen: false).getAllValves();
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: 'Valves of Motor ${widget.motorNo}'),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                child: Container(
                           margin: EdgeInsets.symmetric(
                            vertical: 10),
                           height: 50,
                           width: 200,
                           decoration: BoxDecoration(
                            color: kAshLight,
                            borderRadius: BorderRadius.circular(10)),
                           child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: const [
                           CustomText(text: "Valve List"),                                           
                             ],
                            ),
                           ),
                         ),  
                         Consumer<ValveProviderClass>(
                           builder: (context ,valveProviderClass ,_) {  
                             return Expanded(
                               child: valveProviderClass.valveList.isNotEmpty
                               ? ListView.separated(
                                 shrinkWrap: true,
                                 itemBuilder: (context, index) {
                                   final list = valveProviderClass.valveList[index];
                                   return
                                 Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15,),
                                   child: Row( 
                                    children: [
                                    GestureDetector(
                                     onTap: () {
                             Navigator.of(context).push(MaterialPageRoute(
                             builder: (context) => EditValve(model: list,),));
                            },
                            onLongPress: () {
                          showDialog(
                               context: context,
                               builder: (context) => AlertDialog(
                                 title: Text('Delete Valve'),
                                  content:  Text('Do you want to delete this valve ?'),
                                 actions: [
                                   TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancel'),
                                ),
                                TextButton(
                                onPressed: () {
                              Provider.of<ValveProviderClass>(
                                context,listen: false).deleteData(index);
                              Provider.of<ValveProviderClass>(
                                context,listen: false).getAllValves();
                               Navigator.pop(context);
                                 },
                                 child: Text('Yes'),
                              ),
                            ],
                             ),
                            );
                            },
                            child: Container(
                             height: 80,
                             width: 260,
                             decoration: BoxDecoration(
                             color: kgrey,
                             borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                             ),
                             child: Center(
                             child: CustomText(
                             text: list.valveName,
                             fs: 15,
                             fw: FontWeight.w700,
                             color: kwhite,
                                  ),
                             ),
                            ),
                          ),
                          kWidth2,
                           Consumer<ReceiverProviderClass>(
                             builder: (context,numberProvider,_) {
                               return GestureDetector(
                               onTap: () async {
                                     setState(() {
                                      newValveList[index] = !newValveList[index];
                                     saveValveStatus(
                                      index, newValveList[index]);
                                     telephony.sendSms(
                                      to: numberProvider.motorNumber!.number.toString(),
                                      message:"V${index + 1} ${newValveList[index] ? 'ON' : 'OFF'}" ,
                                      );
                                   });
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
                                 text:newValveList[index]? "OPEN" : "CLOSE",
                                 fs: 15,
                                 fw: FontWeight.w700,
                                 color: kwhite,
                                 )),
                                 ),
                                            );
                             }
                           ),
                                        ],
                                      ),
                                     );
                                    },
                                    separatorBuilder: (context, index) {
                                      return kHeight10;
                                    },
                                     itemCount: valveProviderClass.valveList.length,
                                   ) 
                               : Center(
                               child: CustomText(
                                text: "Click the plus to add new valve",
                                fs: 18,
                                fw: FontWeight.w400,),
                               )
                               );
                              }
                              ),
                               ],
                             ),
                             Positioned(
                                  bottom: 50.0,
                                  right: 30.0,
                                  child: FloatingActionButton(
                                 onPressed: () {
                                 showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                  title: Text('Add New Valve'),
                                  content: TextFormField(
                                  controller: nameController,
                                 decoration: InputDecoration(
                                  hintText: 'Enter Valve Name'),
                                    ),
                                  actions: [
                                 TextButton(
                                   onPressed: () => Navigator.pop(context),
                                   child: Text('Cancel'),
                                 ),
                                 TextButton(
                                  onPressed: () {
                                 var newValveName =nameController.text; 
                                 if (newValveName.isNotEmpty) {
                                 onAddButton();
                                 nameController.clear();
                                 Navigator.pop(context);
                                  } 
                                  },
                                 child: Text('Add'),
                                  ),
                                 ],
                                   ),
                                 );
                               },
                               tooltip: 'Add Valve',
                               child: Icon(Icons.add),
                               ),
                             )
                            ]
                 ),
               );
             }
           
     Future<void> onAddButton() async {
     final name = nameController.text.trim();
     if (name.isEmpty ) {
       return;
     }
     final valve = ValveModel(
       valveName: name,
     );
     Provider.of<ValveProviderClass>(
     context ,listen: false).addNewValve(valve ,newValveList.length);
      }
}