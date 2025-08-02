import 'package:flutter/material.dart';
import 'package:learn_managment1/core/widgets/custom_text_filed.dart';

import '../../core/utils/app_routes.dart' show AppRoutes;
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_button.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "New Password",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create a new password",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Your new password must be different from previous used passwords.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // New Password Field
            CustomTextFiled(
              hintText: "New password",
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              controller: newPasswordController,
            ),
            const SizedBox(height: 20),

            // Confirm Password Field
            CustomTextFiled(
              hintText: "Confirm password",
              prefixIcon: Icons.lock_outline,
              controller: confirmPasswordController,
              isPassword: true,
            ),
            const SizedBox(height: 32),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                backgroundColor: primaryColor,
                text: "Submit",
                onPressed: () {
                  // Add validation and action here
                  final newPassword = newPasswordController.text;
                  final confirmPassword = confirmPasswordController.text;

                  if (newPassword.isEmpty || confirmPassword.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all fields"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (newPassword != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Passwords do not match"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // Proceed with password change
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Password updated"),
                        backgroundColor: primaryColor,
                      ),
                    );
                    Navigator.pushNamed(context, AppRoutes.login);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
