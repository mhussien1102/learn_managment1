import 'package:flutter/material.dart';

class OtpDescription extends StatelessWidget {
  const OtpDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Enter the 6-digit code sent to your email",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, color: Colors.black87),
    );
  }
}
