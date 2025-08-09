import 'package:flutter/material.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/assets.dart';
import '../../../core/model/teacher_model.dart';

class TeacherCard extends StatelessWidget {
  final TeacherModel teacher;
  const TeacherCard({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final isPhone = screen.width < 600;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.teacherDetails,
          arguments: teacher,
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h =
              constraints.maxHeight.isFinite
                  ? constraints.maxHeight
                  : (isPhone ? screen.height * 0.36 : screen.height * 0.32);

          double clamp(num v, num min, num max) =>
              v < min
                  ? min.toDouble()
                  : (v > max ? max.toDouble() : v.toDouble());

          final corner = clamp(w * 0.03, 10, 14);
          final elevation = isPhone ? 3.0 : 4.0;
          final padding = clamp(w * 0.06, 10, 18);
          final titleSize = clamp(w * 0.085, 15, 20);
          final subtitleSize = clamp(w * 0.07, 12, 16);
          final descSize = clamp(w * 0.06, 11, 14);
          final imageHeight = clamp(h * 0.45, 160, 260);

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(corner),
            ),
            elevation: elevation,
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Hero(
                  tag: 'teacher-image-${teacher.name}',
                  child: Image.asset(
                    teacher.image, // AssetImages.teacher as default
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          teacher.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: titleSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          teacher.specialist,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: subtitleSize,
                            color: Colors.grey[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 6),
                        Expanded(
                          child: Text(
                            teacher.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: descSize,
                              color: Colors.grey[600],
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
