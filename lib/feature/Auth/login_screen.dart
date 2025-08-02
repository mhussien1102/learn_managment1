import 'package:flutter/material.dart';
import 'package:learn_managment1/core/utils/app_routes.dart';
import 'package:learn_managment1/core/widgets/custom_text_filed.dart';
import 'package:learn_managment1/core/widgets/custom_button.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      print("Logging in with ${_emailController.text}");
    } else {
      // Show snackbar error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields correctly'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.05),
                Image.asset(
                  Assets.logo,
                  width: size.width * 0.5,
                  color: primaryColor,
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                CustomTextFiled(
                  controller: _emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFiled(
                  controller: _passwordController,
                  hintText: "Password",
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                ),
                SizedBox(height: size.height * 0.03),
                CustomButton(
                  text: "Login",
                  onPressed: _handleLogin,
                  fontSize: size.width * 0.045,
                ),
                SizedBox(height: size.height * 0.02),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.forget);
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
