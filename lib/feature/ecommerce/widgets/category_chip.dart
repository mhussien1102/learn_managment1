import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  const CategoryChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: selected,
      backgroundColor: Colors.transparent,
      selectedColor: primaryColor,
      shape: const StadiumBorder(
        side: BorderSide(color: primaryColor, width: 1.2),
      ),
      onSelected: onSelected,
    );
  }
}
