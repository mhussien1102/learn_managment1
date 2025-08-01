import 'package:flutter/material.dart';
import 'package:learn_managment1/core/widgets/custom_text_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Text(
              "Welcome back",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 32),
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

            SizedBox(height: 24),

            MaterialButton(
              height: 50,
              minWidth: double.infinity,
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),

            SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forget Password?",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
