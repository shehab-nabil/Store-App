import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget{
  Custombutton({required this.label,this.width,this.height,required this.onTap,this.buttonColor});
  String? label;

  double? height =40;
  double? width =double.infinity;
  Color? buttonColor;
  VoidCallback? onTap;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:buttonColor,
          borderRadius: BorderRadius.circular(10),

        ),
        width: width,
        height: height,
        child: Center(child: Text('$label',style:const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),)),

      ),
    );
  }

}