import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

class PaymentMethodOption extends StatelessWidget {
  final String value;
  final String groupValue;
  final void Function(String?) onChanged;
  final IconData icon;

  const PaymentMethodOption({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return RadioListTile<String>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: primaryColor,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Row(
        children: [
          Icon(icon, color: isSelected ? primaryColor : Colors.black),
          const SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(
              color: isSelected ? primaryColor : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
