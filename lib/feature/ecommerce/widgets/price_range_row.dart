import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';

class PriceRangeRow extends StatelessWidget {
  final double min;
  final double max;
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;

  const PriceRangeRow({
    super.key,
    required this.min,
    required this.max,
    required this.values,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price (${values.start.toStringAsFixed(0)} - ${values.end.toStringAsFixed(0)})',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        RangeSlider(
          activeColor: primaryColor,
          min: min,
          max: max,
          values: values,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
