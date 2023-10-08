import 'package:ecommerceshope/utils/constant.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.maximumSize = const Size(double.infinity, 52),
    required this.text,
    this.gradiantColor = greenGradient,
    this.fontSize = 14,
    this.onPressed,
    this.minimumSize = const Size(double.infinity, 52),
    this.borderRadiusSize = 4,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final List<Color> gradiantColor;
  final String text;
  final Size maximumSize;
  final Size minimumSize;
  final double fontSize;
  final double borderRadiusSize;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(borderRadiusSize);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradiantColor,
        ),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius), backgroundColor: redColor,
          minimumSize: minimumSize,
          maximumSize: maximumSize,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white,fontSize: fontSize, height: 1.5, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
