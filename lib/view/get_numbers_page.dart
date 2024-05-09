import 'package:flutter/material.dart';
import 'package:project_m/model/number_model/number_model.dart';
import 'package:project_m/providers/receiver_provider.dart';
import 'package:project_m/utils/utils.dart';
import 'package:project_m/view/motorlist_page.dart';
import 'package:provider/provider.dart';


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
                controller:  motorController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                hintText: 'Enter motor number',
                border: OutlineInputBorder(          
                borderRadius: BorderRadius.circular(20))),),
              kHeight10,
              GestureDetector(
                onTap: () {
                   dynamic number = motorController.text.trim();
                   if (number.isNotEmpty) {
                   final motorNumber = int.parse(number);
                   final numberModel = NumberModel(number: motorNumber);
                   Provider.of<ReceiverProviderClass>(context, listen: false).addNumber(numberModel);
                    }

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MotorListPage(
                       ),));
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