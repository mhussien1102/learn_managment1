import 'package:flutter/material.dart';

import '../utils/constants.dart';

class GenderSelector extends StatelessWidget {
  final String groupValue;

  final ValueChanged<String> onChanged;

  final List<String> options;

  /// Space between options
  final double spacing;

  const GenderSelector({
    super.key,
    required this.groupValue,
    required this.onChanged,
    this.options = const ['Male', 'Female'],
    this.spacing = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      crossAxisAlignment: WrapCrossAlignment.center,
      children:
          options.map((opt) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  activeColor: primaryColor,
                  value: opt,
                  groupValue: groupValue,
                  onChanged: (v) {
                    if (v != null) onChanged(v);
                  },
                ),
                Text(opt),
              ],
            );
          }).toList(),
    );
  }
}
