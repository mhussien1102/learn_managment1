import 'package:flutter/material.dart';
import '../../../core/model/filter_product_model.dart';
import '../../../core/utils/constants.dart';

class SortDropdown extends StatelessWidget {
  final SortOption value;
  final ValueChanged<SortOption> onChanged;

  const SortDropdown({super.key, required this.value, required this.onChanged});

  DropdownMenuItem<SortOption> _menuItem(
    SortOption v,
    String label,
    bool isSelected,
  ) {
    return DropdownMenuItem(
      value: v,
      child: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.black : Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<SortOption>(
      dropdownColor: primaryColor,
      value: value,
      isExpanded: true,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      items: [
        _menuItem(SortOption.none, 'None', value == SortOption.none),
        _menuItem(
          SortOption.priceAsc,
          'Price: Low to High',
          value == SortOption.priceAsc,
        ),
        _menuItem(
          SortOption.priceDesc,
          'Price: High to Low',
          value == SortOption.priceDesc,
        ),
        _menuItem(
          SortOption.nameAsc,
          'Name (A–Z)',
          value == SortOption.nameAsc,
        ),
        _menuItem(
          SortOption.salesDesc,
          'Best Sellers',
          value == SortOption.salesDesc,
        ),
      ],
      onChanged: (v) => onChanged(v ?? SortOption.none),
    );
  }
}
