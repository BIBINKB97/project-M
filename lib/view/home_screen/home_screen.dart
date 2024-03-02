import 'package:flutter/material.dart';
import 'package:project_m/utils/utils.dart';
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
    return 
    Scaffold(
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
              height: 200,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        motorStates[index] = !motorStates[index];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: motorStates[index] ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: CustomText(
                        text: "Motor ${index + 1}\n\t  ${motorStates[index] ? "OFF" : "ON"}",
                        fs: 20,
                        fw: FontWeight.w700,
                        color: kwhite,
                      )),
                    ),
                  );
                },
                itemCount: 2,
              ),
            ),
            CustomText(
              text: "Valve's",
              fs: 23,
              fw: FontWeight.w500,
              color: kblack,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
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
                        text: "Valve ${index + 1}\n\t${valveStates[index] ? "Close" : "Open"}",
                        fs: 15,
                        fw: FontWeight.w700,
                        color: kwhite,
                      )),
                    ),
                  );
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
