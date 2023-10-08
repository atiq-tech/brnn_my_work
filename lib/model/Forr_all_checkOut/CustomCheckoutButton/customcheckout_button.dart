import 'package:ecommerceshope/Screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class Custom_Checkout_Button extends StatefulWidget {
  const Custom_Checkout_Button({Key? key}) : super(key: key);

  @override
  State<Custom_Checkout_Button> createState() => _Custom_Checkout_ButtonState();
}

class _Custom_Checkout_ButtonState extends State<Custom_Checkout_Button> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
        bottom: 20,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromARGB(-100, -200, 300, -600),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text("Check out",style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
        letterSpacing: 1,
      ),),
    );
  }
}
