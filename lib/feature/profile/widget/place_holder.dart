import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

class PlaceholderField extends StatelessWidget {
  final String label;
  final int maxLines;
  const PlaceholderField({required this.label, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      constraints: BoxConstraints(minHeight: maxLines == 1 ? 64 : 104),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColor.withOpacity(0.7), width: 2),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
      ),
    );
  }
}
