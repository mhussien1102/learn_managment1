import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class Teacher extends StatelessWidget {
  const Teacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher"),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
    );
  }
}
