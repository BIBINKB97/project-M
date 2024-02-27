import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final EdgeInsetsGeometry ?margin;
  final EdgeInsetsGeometry ?padding;
  final Widget ?child;
  final double? height;
  final double? width;
  final double? borderRadius;
    final BoxBorder? border;
  final Color? color;
  final DecorationImage? image;

  const CustomContainer({
    Key? key,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
     this.child,
    this.height,
    this.width,
    this.color, 
    this.borderRadius,
     this.border, this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      // decoration: decoration,
      decoration: BoxDecoration(  
         color: color,
         image: image,
        border: border,
        borderRadius: BorderRadius.circular(borderRadius!)),
      
      child: child,
    );
  }
}
