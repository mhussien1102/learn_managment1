import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

class TextFiledPhoneWidget extends StatelessWidget {
  final TextEditingController phoneController;
  final String txt;

  const TextFiledPhoneWidget({
    required this.phoneController,
    required this.txt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: primaryColor,
      controller: phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: txt,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFD1D9E2), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: primaryColor, width: 1.8),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFD1D9E2)),
        ),
      ),
    );
  }
}
