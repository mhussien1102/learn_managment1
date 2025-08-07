import 'package:flutter/material.dart';
import '../../../core/model/product_model.dart';
import '../model/filter_product_model.dart';

List<ProductModel> applyProductFilters(
  List<ProductModel> products,
  ProductFilters filters,
) {
  final q = filters.searchQuery.trim().toLowerCase();
  final r = filters.priceRange;

  List<ProductModel> out =
      products.where((p) {
        final inSearch =
            q.isEmpty ||
            p.name.toLowerCase().contains(q) ||
            p.author.toLowerCase().contains(q);
        final price = p.price.toDouble();
        final inPrice = price >= r.start && price <= r.end;
        final inCat =
            filters.categories.isEmpty
                ? true
                : filters.categories.contains(p.category);
        return inSearch && inPrice && inCat;
      }).toList();

  switch (filters.sort) {
    case SortOption.priceAsc:
      out.sort((a, b) => a.price.compareTo(b.price));
      break;
    case SortOption.priceDesc:
      out.sort((a, b) => b.price.compareTo(a.price));
      break;
    case SortOption.nameAsc:
      out.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      break;
    case SortOption.salesDesc:
      out.sort((a, b) => b.sales.compareTo(a.sales));
      break;
    case SortOption.none:
      break;
  }
  return out;
}
