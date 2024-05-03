import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fs;
  final FontWeight? fw;
  final Color? color;
  const CustomText({super.key,
   required this.text, 
   this.fs, 
   this.fw, 
   this.color,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ,
      style: TextStyle(fontSize: fs ,fontWeight: fw,color: color),
    );
  }
}