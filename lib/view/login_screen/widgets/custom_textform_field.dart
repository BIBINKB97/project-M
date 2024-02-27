import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
 final String? Function(String?)? validator;
  final TextEditingController controller ;
  final dynamic keyboardType; 
  final bool obscureText;
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller, required this.validator, this.keyboardType,  required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
          decoration: InputDecoration(    
            
           label: Text(label),
           border: OutlineInputBorder(

           borderRadius: BorderRadius.circular(15))),
            validator: validator,
       
       );
  }
}