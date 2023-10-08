import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({Key? key,this.maxLines,this.prefixIcon,this.Textdata,this.hintText,required this.controller,required this.validator}) : super(key: key);
  final Widget? prefixIcon;
   final String? Textdata,hintText;
   final TextEditingController controller;
   final FormFieldValidator ? validator;
   final int ? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller:controller ,
      maxLines:maxLines ,
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey,),
      ),
    );
  }
}
