import 'package:flutter/material.dart';
import '../../core/model/teacher_model.dart';
import '../../core/utils/constants.dart';

class TeacherDetails extends StatelessWidget {
  final TeacherModel teacher;
  const TeacherDetails({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isWide = size.width >= 800;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          teacher.name,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: (size.width * 0.06).clamp(16, 32).toDouble(),
          vertical: (size.height * 0.02).clamp(12, 24).toDouble(),
        ),
        child:
            isWide
                ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Hero(
                        tag: 'teacher-image-${teacher.name}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            teacher.image,
                            height: size.height * 0.6,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(flex: 5, child: _DetailsContent(teacher: teacher)),
                  ],
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Hero(
                      tag: 'teacher-image-${teacher.name}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          teacher.image,
                          height: size.height * 0.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DetailsContent(teacher: teacher),
                  ],
                ),
      ),
    );
  }
}

class _DetailsContent extends StatelessWidget {
  final TeacherModel teacher;
  const _DetailsContent({required this.teacher});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    double clamp(num v, num min, num max) =>
        v < min ? min.toDouble() : (v > max ? max.toDouble() : v.toDouble());

    final titleSize = clamp(width * 0.06, 20, 28);
    final chipSize = clamp(width * 0.04, 12, 16);
    final bodySize = clamp(width * 0.04, 13, 16);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          teacher.name,
          style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Chip(
              label: Text(
                teacher.specialist,
                style: TextStyle(fontSize: chipSize),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          teacher.description,
          style: TextStyle(
            fontSize: bodySize,
            height: 1.5,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
