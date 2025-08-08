import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/teacher/widget/teacher_card.dart';

import '../../core/utils/constants.dart';
import '../../core/widgets/custom_drawer.dart';
import '../../core/widgets/custom_text_filed.dart';

class Teacher extends StatelessWidget {
  const Teacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Teacher",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            CustomTextFiled(
              hintText: 'Search',
              prefixIcon: Icons.search,
              isPassword: false,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return TeacherCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
