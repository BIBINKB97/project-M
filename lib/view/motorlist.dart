import 'package:flutter/material.dart';
import 'package:project_m/utils/utils.dart';
import 'package:project_m/view/valvelist.dart';
import 'package:project_m/view/widgets/custom_text.dart';
import 'package:telephony/telephony.dart';


class MotorListPage extends StatefulWidget {
  final TextEditingController numberController ;
  const MotorListPage({super.key, required this.numberController});
  @override
  State<MotorListPage> createState() => _MotorListPageState();
}

class _MotorListPageState extends State<MotorListPage> {
List<bool> isMotorOnList = [false, false]; 
final Telephony telephony = Telephony.instance;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text:'Motor Control panel'),
      ),
      body:  ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ValveList(
                    motorNo: index+1,
                  numberController: TextEditingController(
                  text: widget.numberController.text),
                  ),
                  )
                  );
                },
                child: Container(
                  height: 80,
                  width: 260,
                  decoration: BoxDecoration(
                    color: kgrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: " Motor ${index + 1}",
                        fs: 15,
                        fw: FontWeight.w700,
                        color: kwhite,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () async {
                   setState(() {
                    isMotorOnList[index] = !isMotorOnList[index];
                  });
                  //  telephony.sendSms(
                  // to: widget.numberController.text,
                  // message:"M${index + 1} ${isMotorOnList[index] ? 'ON' : 'OFF'}" ,
                  // );
                   showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      content: SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Column(children: [
                               
                        ],),
                      ),
                      actions: [
                        TextButton(onPressed: () {
                        Navigator.pop(context);
                        }, child: Text("close")),
                      ],
                    );
                  },);
              
                },
                child: Container(
                  height: 80,
                  width: 100,
                  decoration: BoxDecoration(
                  color: isMotorOnList[index] ? Colors.green : kred,
                  borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: CustomText(
                      text: isMotorOnList[index] ? "ON" : "OFF",
                      fs: 15,
                      fw: FontWeight.w700,
                      color: kwhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
         );
       },
      ),
    );
  }
}

