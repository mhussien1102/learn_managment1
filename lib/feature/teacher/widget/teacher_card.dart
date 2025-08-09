import 'package:flutter/material.dart';
import '../../../core/utils/assets.dart';

class TeacherCard extends StatelessWidget {
  const TeacherCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final isPhone = screen.width < 600;

    return GestureDetector(
      onTap: () {},
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Size coming from the Grid cell
          final w = constraints.maxWidth;
          final h =
              constraints.maxHeight.isFinite
                  ? constraints.maxHeight
                  : (isPhone ? screen.height * 0.36 : screen.height * 0.32);

          // Scale UI with available space
          double clamp(num v, num min, num max) =>
              v < min
                  ? min.toDouble()
                  : (v > max ? max.toDouble() : v.toDouble());

          final corner = clamp(w * 0.03, 10, 14);
          final elevation = isPhone ? 3.0 : 4.0;
          final padding = clamp(w * 0.06, 10, 18);

          // Font sizes scale with width
          final titleSize = clamp(w * 0.085, 15, 20);
          final subtitleSize = clamp(w * 0.07, 12, 16);
          final descSize = clamp(w * 0.06, 11, 14);

          // Image takes a portion of available height (works in any grid size)
          final imageHeight = clamp(h * 0.45, 160, 260);

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(corner),
            ),
            elevation: elevation,
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                // Top image
                Image.asset(
                  AssetImages.teacher,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Texts
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Mr.Ali Ahmed",
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
                          "Science",
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
                            "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
                            maxLines: 1,
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
