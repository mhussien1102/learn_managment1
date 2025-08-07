import 'package:flutter/material.dart';

enum SortOption { none, priceAsc, priceDesc, nameAsc, salesDesc }

class ProductFilters {
  final Set<String> categories;
  final RangeValues priceRange;
  final SortOption sort;
  final String searchQuery;

  const ProductFilters({
    required this.categories,
    required this.priceRange,
    this.sort = SortOption.none,
    this.searchQuery = '',
  });

  ProductFilters copyWith({
    Set<String>? categories,
    RangeValues? priceRange,
    SortOption? sort,
    String? searchQuery,
  }) {
    return ProductFilters(
      categories: categories ?? this.categories,
      priceRange: priceRange ?? this.priceRange,
      sort: sort ?? this.sort,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  static const empty = ProductFilters(
    categories: <String>{},
    priceRange: RangeValues(0, 0),
    sort: SortOption.none,
    searchQuery: '',
  );
}
