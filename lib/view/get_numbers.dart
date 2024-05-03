import 'package:flutter/material.dart';
import 'package:project_m/utils/utils.dart';
import 'package:project_m/view/motorlist.dart';


class GetNumber extends StatelessWidget {
  const GetNumber({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController motorController =TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: motorController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                hintText: 'Enter motor number',
                border: OutlineInputBorder(          
                borderRadius: BorderRadius.circular(20))),),
              kHeight10,
              GestureDetector(
                onTap: () {
                  
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MotorListPage(),));
                },
                child: Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration( color: kblue, borderRadius:BorderRadius.circular(30)),
                  child: Center(child: Text("Submit",style: TextStyle(color: kwhite,fontSize: 18,fontWeight: FontWeight.w500),),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}