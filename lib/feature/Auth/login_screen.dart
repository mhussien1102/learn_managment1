import 'package:flutter/material.dart';
import 'package:learn_managment1/core/widgets/custom_text_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2B36),
                ),
              ),
              SizedBox(height: 10),
              CustomTextFiled(
                hintText: 'Email',
                prefixIcon: Icons.email_outlined,
              ),

              SizedBox(height: 16),

              CustomTextFiled(
                hintText: "Password",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
