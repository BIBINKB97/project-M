import 'package:flutter/material.dart';
import 'package:project_m/controller/motor_controller.dart';
import 'package:project_m/model/motor_model.dart';
import 'package:project_m/utils/utils.dart';
import 'package:project_m/view/home_screen/widgets/dialogue.dart';
import 'package:project_m/view/widgets/text_style.dart';

class ValveListScreen extends StatefulWidget {
  const ValveListScreen({Key? key}): super(key: key);

  @override
  State<ValveListScreen> createState() => _ValveListScreenState();
}
class _ValveListScreenState extends State<ValveListScreen> {
  List<bool>  motorStates = List<bool>.generate(2,(index) => false);
  List<bool> valveStates = List<bool>.generate(50,(index) => false);

  @override
  Widget build( BuildContext context) {
    getAllMotors();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "motorname 's valves",
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
                    valueListenable: motorListNotifier,
                    builder: (BuildContext context, List<MotorModel> motorList, Widget? child) {
                      return ListView.separated(
                   separatorBuilder: (context, index) {
                     return kHeight10;
                      },
                        itemBuilder: (context, index) {
                          final data = motorList[index];
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
                               text: " ${index+1}. ${data.motorName}",
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
                                 text: valveStates[index] ? "ON" : "OFF",
                                 fs: 15,
                                 fw: FontWeight.w700,
                                 color: kwhite,
                              )),
                              ),
                               ),
                            ],
                          );
                           },
                           itemCount: motorList.length,
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
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => ValveListScreen(),));
            },
          ),
    );
  }
}
