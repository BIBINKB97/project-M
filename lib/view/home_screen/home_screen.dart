import 'package:flutter/material.dart';
import 'package:project_m/controller/motor_controller.dart';
import 'package:project_m/model/motor_model.dart';
import 'package:project_m/utils/utils.dart';
import 'package:project_m/view/home_screen/widgets/dialogue.dart';
import 'package:project_m/view/widgets/text_style.dart';

class HomeScreen
    extends StatefulWidget {
  const HomeScreen(
      {Key?
          key})
      : super(key: key);

  @override
  State<HomeScreen>
      createState() => 
          _HomeScreenState();
}

class _HomeScreenState
    extends State<
        HomeScreen> {
  List<bool>
      motorStates =
      List<bool>.generate(2,
          (index) => false);
  List<bool>
      valveStates =
      List<bool>.generate(50,
          (index) => false);

  @override
  Widget build(
      BuildContext
          context) {
    getAllMotors();
    return Scaffold(
      appBar:
          AppBar(
        title: CustomText(
          text: "Control Panel",
          fs: 25,
          fw: FontWeight.w700,
          color: kblack,
        ),
        centerTitle: true,
      ),
      body:
          Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomText(
              text: "Motor's",
              fs: 23,
              fw: FontWeight.w500,
              color: kblack,
            ),
            SizedBox(
                height: 240,
                width: double.infinity,
                child: ValueListenableBuilder(
                  valueListenable: motorListNotifier,
                  builder: (BuildContext context, List<MotorModel> motorList, Widget? child) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        final data = motorList[index];
                        return GestureDetector(
                          onLongPress: () {
                           deleteData(index);
                          },
                          onTap: () {
                            setState(() {
                              valveStates[index] = !valveStates[index];
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: valveStates[index] ? Colors.green : Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: CustomText(
                              text: "${data.motorName}\n\t${valveStates[index] ? "ON" : "OFF"}",
                              fs: 15,
                              fw: FontWeight.w700,
                              color: kwhite,
                            )),
                          ),
                        );
                      },
                      itemCount: motorList.length,
                    );
                  },
                )),
            // CustomText(
            //   text: "Valve's",
            //   fs: 23,
            //   fw: FontWeight.w500,
            //   color: kblack,
            // ),
            // Expanded(
            //   child: GridView.builder(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             valveStates[index] = !valveStates[index];
            //           });
            //         },
            //         child: Container(
            //           margin: EdgeInsets.all(10),
            //           decoration: BoxDecoration(
            //             color: valveStates[index] ? Colors.green : Colors.red,
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: Center(
            //               child: CustomText(
            //             text: "Valve ${index + 1}\n\t${valveStates[index] ? "Close" : "Open"}",
            //             fs: 15,
            //             fw: FontWeight.w700,
            //             color: kwhite,
            //           )),
            //         ),
            //       );
            //     },
            //     itemCount: 20,
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingButton(),
    );
  }
}
