import 'package:flutter/material.dart';
import 'package:project_m/controller/motor_controller.dart';
import 'package:project_m/controller/valve_controller.dart';
import 'package:project_m/models/valve_model/valve_model.dart';
import 'package:project_m/utils/utils.dart';
import 'package:project_m/view/motor/motor_list_screen/widgets/dialogue.dart';
import 'package:project_m/view/valve/add_new_valve/add_new_valve.dart';
import 'package:project_m/view/widgets/text_style.dart';

class ValveListScreen extends StatefulWidget {
  const ValveListScreen({Key? key}): super(key: key);

  @override
  State<ValveListScreen> createState() => _ValveListScreenState();
}
class _ValveListScreenState extends State<ValveListScreen> {
  List<bool> valveStates = List<bool>.generate(50,(index) => false);

  @override
  Widget build( BuildContext context) {
    getAllvalves();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "motorname's valves",
          fs: 25,
          fw: FontWeight.w700,
          color: kblack,
        ),
        centerTitle: true,
      ),
      body:
          SingleChildScrollView(
            child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
            children: [
              CustomText(
                text: "Valve's",
                fs: 23,
                fw: FontWeight.w500,
                color: kblack,
              ),
              kHeight30,
              SizedBox(
                 height: 670,                
                  child: ValueListenableBuilder(
                    valueListenable: valveListNotifier,
                    builder: (BuildContext context, List<ValveModel> valveList, Widget? child) {
                      return ListView.separated(
                   separatorBuilder: (context, index) {
                     return kHeight10;
                      },
                        itemBuilder: (context, index) {
                          final data = valveList[index];
                          return Row(
                            children: [
                              Container(
                               height: 80,
                               width: 240,
                               decoration: BoxDecoration(
                                color: valveStates[index] ? Colors.green : Colors.red,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                               ),
                               child: Center(
                               child: CustomText(
                               text: " ${index+1}. ${data.valveName}",
                               fs: 15,
                               fw: FontWeight.w700,
                               color: kwhite,
                              )),
                              ),
                              kWidth2,
                               GestureDetector(
                            onTap: () {
                             setState(() {
                             valveStates[index] = !valveStates[index];
                                 });
                                 },
                                 child: Container(
                                 height: 80,
                                 width: 100,
                                 decoration: BoxDecoration(
                                  color: valveStates[index] ? Colors.green : Colors.red,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                                 ),
                                 child: Center(
                                 child: CustomText(
                                 text: valveStates[index] ? "Open" : "Close",
                                 fs: 15,
                                 fw: FontWeight.w700,
                                 color: kwhite,
                              )),
                              ),
                               ),
                            ],
                          );
                           },
                           itemCount: valveList.length,
                      );
                    },
                  )),
                 ],
               ),
             ),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          FloatingButton(
            title: "Add New Valve",
            subTitle: "Do you want to add a new Valve ?",
            onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewValveScreen(),));
            },
          ),
    );
  }
}
