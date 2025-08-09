import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/teacher/widget/teacher_card.dart';

import '../../core/utils/constants.dart';
import '../../core/widgets/custom_drawer.dart';
import '../../core/widgets/custom_text_filed.dart';
import '../../core/model/teacher_model.dart';
import 'data/teacher_data.dart'; // <- add this

class Teacher extends StatelessWidget {
  const Teacher({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    // Breakpoints & grid
    final bool isPhone = width < 600;
    final bool isTablet = width >= 600 && width < 1024;

    final int crossAxisCount = () {
      if (isPhone) return isPortrait ? 2 : 3;
      if (isTablet) return isPortrait ? 3 : 4;
      return isPortrait ? 4 : 5;
    }();

    double gap(double w) => w * 0.02;
    final crossGap = gap(width).clamp(8.0, 20.0);
    final mainGap = crossGap;

    final double childAspectRatio = () {
      if (width < 360) return 0.55;
      if (width < 600) return 0.60;
      if (width < 900) return 0.66;
      if (width < 1200) return 0.72;
      return 0.78;
    }();

    final horizontalPad = (width * 0.04).clamp(12, 32);
    final verticalPad = (size.height * 0.015).clamp(8, 24);

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
      drawer: const CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPad.toDouble(),
          horizontal: horizontalPad.toDouble(),
        ),
        child: Column(
          children: [
            SizedBox(
              height: isPhone ? 46 : 52,
              child: const CustomTextFiled(
                hintText: 'Search',
                prefixIcon: Icons.search,
                isPassword: false,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: crossGap.toDouble(),
                  mainAxisSpacing: mainGap.toDouble(),
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: kTeachers.length, // <- use from data file
                itemBuilder: (context, index) {
                  final t = kTeachers[index]; // <- use from data file
                  return TeacherCard(teacher: t);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
