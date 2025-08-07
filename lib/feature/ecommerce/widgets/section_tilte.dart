import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  const SectionTitle(
    this.text, {
    super.key,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
