import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/profile/widget/place_holder.dart';

import '../../core/utils/constants.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F4F7), // soft background like the mock
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),

      // Main body
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar with online indicator
            SizedBox(
              height: 130,
              width: 130,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 58,
                    backgroundColor: primaryColor,
                    child: const Icon(
                      Icons.person,
                      size: 56,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 18,
                    bottom: 18,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const SizedBox(height: 18),
            const PlaceholderField(label: 'Phone'),
            const SizedBox(height: 18),
            const PlaceholderField(label: 'Address', maxLines: 2),
            const SizedBox(height: 18),
            const PlaceholderField(label: 'Age'),
            const SizedBox(height: 18),
            CustomButton(text: 'Previous Bills', onPressed: () {}),
          ],
        ),
      ),

      // Big rounded "Previous Bills" button (UI only)
    );
  }
}
