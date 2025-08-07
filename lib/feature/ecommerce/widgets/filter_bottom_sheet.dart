import 'package:flutter/material.dart';
import '../../../core/model/filter_product_model.dart';
import '../../../core/utils/constants.dart';

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

  void _emitChange() {
    final filters = ProductFilters(
      categories: _selectedCats,
      priceRange: _range,
      sort: _sort,
      searchQuery: widget.initial.searchQuery, // search stays external
    );
    widget.onChanged?.call(filters);
  }

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
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const SizedBox(height: 8),

          if (widget.allCategories.isNotEmpty) ...[
            const Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  widget.allCategories.map((c) {
                    final selected = _selectedCats.contains(c);
                    return FilterChip(
                      label: Text(
                        c,
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
                      onSelected: (v) {
                        setState(() {
                          if (v) {
                            _selectedCats.add(c);
                          } else {
                            _selectedCats.remove(c);
                          }
                        });
                        _emitChange();
                      },
                    );
                  }).toList(),
            ),
            const SizedBox(height: 16),
          ],

          Text(
            'Price (${_range.start.toStringAsFixed(0)} - ${_range.end.toStringAsFixed(0)})',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          RangeSlider(
            activeColor: primaryColor,
            min: widget.minPrice,
            max: widget.maxPrice,
            values: _range,
            onChanged: (v) {
              setState(() => _range = v);
              _emitChange();
            },
          ),
          const SizedBox(height: 8),

          const Text('Sort by', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          DropdownButton<SortOption>(
            dropdownColor: primaryColor,
            value: _sort,
            isExpanded: true,
            style: const TextStyle(
              color: Colors.black, // closed state selected item color
              fontWeight: FontWeight.w500,
            ),
            items: [
              _menuItem(SortOption.none, 'None'),
              _menuItem(SortOption.priceAsc, 'Price: Low to High'),
              _menuItem(SortOption.priceDesc, 'Price: High to Low'),
              _menuItem(SortOption.nameAsc, 'Name (A–Z)'),
              _menuItem(SortOption.salesDesc, 'Best Sellers'),
            ],
            onChanged: (v) {
              setState(() => _sort = v ?? SortOption.none);
              _emitChange();
            },
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    widget.onApply?.call(
                      ProductFilters(
                        categories: _selectedCats,
                        priceRange: _range,
                        sort: _sort,
                        searchQuery: widget.initial.searchQuery,
                      ),
                    );
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
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  DropdownMenuItem<SortOption> _menuItem(SortOption value, String label) {
    // Menu list text white; selected one shows black (per your requirement)
    final isSelected = _sort == value;
    return DropdownMenuItem(
      value: value,
      child: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.black : Colors.white),
      ),
    );
  }
}
