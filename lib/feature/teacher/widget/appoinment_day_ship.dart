import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';

class AppointmentDayChips extends StatelessWidget {
  final List<String> days;
  final String? selectedDay;
  final ValueChanged<String> onDaySelected;

  const AppointmentDayChips({
    super.key,
    required this.days,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Available Days:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children:
              days.map((d) {
                final selected = selectedDay == d;
                return ChoiceChip(
                  label: Text(d),
                  selected: selected,
                  onSelected: (_) => onDaySelected(d),
                  selectedColor: primaryColor,
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  backgroundColor: const Color(0xffe9edf1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                );
              }).toList(),
        ),
      ],
    );
  }
}
