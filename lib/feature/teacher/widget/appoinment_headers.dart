import 'package:flutter/material.dart';
import '../../../core/model/teacher_model.dart';

class AppointmentHeader extends StatelessWidget {
  final TeacherModel t;
  const AppointmentHeader({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(radius: 50, backgroundImage: AssetImage(t.image)),
          const SizedBox(height: 12),
          Text(
            t.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            t.specialist,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }
}
