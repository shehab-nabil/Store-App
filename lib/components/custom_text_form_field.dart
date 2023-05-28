import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({
    super.key,
    this.hintText,
    this.hintColor,
    this.label,
    this.labelColor,
    this.prefixIcon,
    this.prefixIconColor,
    this.borderColor,
    this.circularBorderRadius,
    this.focusBorderColor,
    this.onChange,
    this.textIsHidden =false,
    this.textType,
  });
  // this.isHidden = false

  String? hintText;
  Color? hintColor;

  String? label;
  Color? labelColor;

  IconData? prefixIcon;
  Color? prefixIconColor;

  Function(String)? onChange;

  Color? borderColor;
  Color? focusBorderColor;
  double? circularBorderRadius;

  bool textIsHidden ;
 // bool activeValid

  TextInputType? textType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textType,
      obscureText: textIsHidden,
      validator: (data) {
        if (data!.isEmpty) {
          return "can't be empty";
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        label: label == null ? null : Text('$label'),
        labelStyle: TextStyle(color: labelColor),
        prefixIcon: Icon(prefixIcon),
        prefixIconColor: prefixIconColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor == null ? Colors.black : borderColor!,
            ),
            borderRadius: circularBorderRadius == null
                ? BorderRadius.zero
                : BorderRadius.circular(circularBorderRadius!)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  focusBorderColor == null ? Colors.black : focusBorderColor!,
            ),
            borderRadius: circularBorderRadius == null
                ? BorderRadius.zero
                : BorderRadius.circular(circularBorderRadius!)),
      ),
    );
  }
}
