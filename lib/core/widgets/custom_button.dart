import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final Color textColor;
  final double? fontSize;
  final BorderRadiusGeometry borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.backgroundColor = primaryColor,
    this.textColor = Colors.white,
    this.fontSize,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final responsiveHeight =
        height ?? screenHeight * 0.06; // approx 48–50px on normal screens
    final responsiveFontSize =
        fontSize ?? screenWidth * 0.04; // e.g. 16 on 400px screen

    return SizedBox(
      width: width ?? double.infinity,
      height: responsiveHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: responsiveFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
