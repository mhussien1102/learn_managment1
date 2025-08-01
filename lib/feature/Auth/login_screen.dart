import 'package:flutter/material.dart';
import 'package:learn_managment1/core/widgets/custom_text_filed.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.05),
              Image.asset(
                Assets.logo,
                width: size.width * 0.5,
                color: Colors.blueAccent,
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              const CustomTextFiled(
                hintText: 'Email',
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(height: size.height * 0.02),
              const CustomTextFiled(
                hintText: "Password",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  text: "Login",
                  onPressed: () {
                    // Add login logic
                  },
                  fontSize: size.width * 0.045,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: size.width * 0.04,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
