import 'package:flutter/material.dart';

class LeaadingButton extends StatelessWidget {
  const LeaadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:() {
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back,size: 25,));
  }
}
