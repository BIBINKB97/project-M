import 'package:flutter/material.dart';
import 'package:project_m/utils/utils.dart';
import 'package:project_m/view/widgets/Custom_container.dart';
import 'package:project_m/view/widgets/text_style.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
             height: 300,
              width: double.infinity,
              child: Form(
              
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      
                      decoration: InputDecoration(
                          label: Text('Username'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "enter username";
                        }
                        if (value.trim().length < 8) {
                          return "Minimum 8 characters required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                         
                          label: Text('Password'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator:(value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Enter a password";
                        }
                        if (value.trim().length < 8) {
                          return "Minimum 8 characters required";
                        }
                        return null;
                      },
                    ),
                   InkWell(
                    onTap: ()async {
                      //  Logic for Login
                  Navigator.of(context).pushNamed('/home');
                    },
                     child: CustomContainer(
                      height: 55,
                      width: 200,
                        borderRadius: 10,
                        border: Border.all(
                          width: 2,
                          color: kblue),
                      color: kgrey,
                      child: Center(child: CustomText(text: "Submit",fs: 19,fw: FontWeight.w600,color: kwhite,)),
                     ),
                   ) ,
                  ],
                ),
              ),
            ),
          Container(
           height: 50,
            margin:EdgeInsets.symmetric(horizontal: 20) ,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 CustomText(text:"Don't have an account ?",),
                 TextButton(onPressed: () { 
                  Navigator.of(context).pushNamed('/register');
                  },
                 child: CustomText(text:'Register Now',fs: 16,fw: FontWeight.w600,color:kblue ,),)
                      ],),
            )
          ],
        ),
      ),
    );
  }
}
