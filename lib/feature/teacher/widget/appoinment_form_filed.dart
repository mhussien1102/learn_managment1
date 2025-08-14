import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text_filed.dart';
import '../../../core/widgets/gender_selector.dart';

class AppointmentFormFields extends StatelessWidget {
  final TextEditingController nameCtrl;
  final TextEditingController ageCtrl;
  final TextEditingController educationLevelCtrl;
  final String gender;
  final ValueChanged<String> onGenderChanged;
  final TextEditingController notesCtrl;

  const AppointmentFormFields({
    super.key,
    required this.nameCtrl,
    required this.ageCtrl,
    required this.educationLevelCtrl,
    required this.gender,
    required this.onGenderChanged,
    required this.notesCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFiled(
          hintText: "Name",
          prefixIcon: Icons.person,
          controller: nameCtrl,
        ),
        const SizedBox(height: 12),
        CustomTextFiled(
          hintText: "Age",
          prefixIcon: Icons.calendar_today,
          controller: ageCtrl,
        ),
        const SizedBox(height: 8),
        CustomTextFiled(
          hintText: "Enter Educational Level",
          prefixIcon: Icons.school,
          controller: educationLevelCtrl,
        ),
        const SizedBox(height: 8),
        GenderSelector(groupValue: gender, onChanged: onGenderChanged),
        const SizedBox(height: 8),
        CustomTextFiled(
          hintText: "Enter additional notes",
          prefixIcon: Icons.note_alt_outlined,
          controller: notesCtrl,
        ),
      ],
    );
  }
}
