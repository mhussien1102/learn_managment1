import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/ecommerce/widgets/section_tilte.dart';
import 'package:learn_managment1/feature/ecommerce/widgets/sort_drop_down.dart';
import '../../../core/model/filter_product_model.dart';
import '../../../core/utils/constants.dart';

import 'ui_spacing.dart';
import 'category_chip.dart';
import 'price_range_row.dart';

class FilterBottomSheet extends StatefulWidget {
  final List<String> allCategories;
  final double minPrice;
  final double maxPrice;

  /// Current filters (used to initialize controls)
  final ProductFilters initial;

  /// Called on every change (live preview)
  final ValueChanged<ProductFilters>? onChanged;

  /// Called when user taps "Apply"
  final ValueChanged<ProductFilters>? onApply;

  const FilterBottomSheet({
    super.key,
    required this.allCategories,
    required this.minPrice,
    required this.maxPrice,
    required this.initial,
    this.onChanged,
    this.onApply,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late Set<String> _selectedCats;
  late RangeValues _range;
  late SortOption _sort;

  @override
  void initState() {
    super.initState();
    _selectedCats = {...widget.initial.categories};
    _range = widget.initial.priceRange;
    _sort = widget.initial.sort;
  }

  ProductFilters _currentFilters() => ProductFilters(
    categories: _selectedCats,
    priceRange: _range,
    sort: _sort,
    searchQuery: widget.initial.searchQuery, // search controlled outside
  );

  void _emitChange() => widget.onChanged?.call(_currentFilters());

  void _reset() {
    setState(() {
      _selectedCats.clear();
      _range = RangeValues(widget.minPrice, widget.maxPrice);
      _sort = SortOption.none;
    });
    _emitChange();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: UISpacing.pad,
        right: UISpacing.pad,
        top: UISpacing.pad,
        bottom: MediaQuery.of(context).viewInsets.bottom + UISpacing.pad,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              const Text(
                'Filter',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: _reset,
                child: const Text(
                  'Reset',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ],
          ),
          UISpacing.gap8,

          // Categories
          if (widget.allCategories.isNotEmpty) ...[
            const SectionTitle('Categories'),
            UISpacing.gap8,
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  widget.allCategories.map((c) {
                    final selected = _selectedCats.contains(c);
                    return CategoryChip(
                      label: c,
                      selected: selected,
                      onSelected: (v) {
                        setState(
                          () =>
                              v
                                  ? _selectedCats.add(c)
                                  : _selectedCats.remove(c),
                        );
                        _emitChange();
                      },
                    );
                  }).toList(),
            ),
            UISpacing.gap16,
          ],

          // Price
          PriceRangeRow(
            min: widget.minPrice,
            max: widget.maxPrice,
            values: _range,
            onChanged: (v) {
              setState(() => _range = v);
              _emitChange();
            },
          ),
          UISpacing.gap8,

          // Sort
          const SectionTitle('Sort by'),
          UISpacing.gap8,
          SortDropdown(
            value: _sort,
            onChanged: (v) {
              setState(() => _sort = v);
              _emitChange();
            },
          ),
          UISpacing.gap16,

          // Footer
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    widget.onApply?.call(_currentFilters());
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Apply',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          UISpacing.gap8,
        ],
      ),
    );
  }
}
