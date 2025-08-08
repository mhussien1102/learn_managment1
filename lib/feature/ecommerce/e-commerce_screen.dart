import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/ecommerce/widgets/filter_bottom_sheet.dart';

import '../../core/model/filter_product_model.dart';
import '../../core/model/product_model.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/filtering.dart';
import '../../core/widgets/custom_card.dart';
import '../../core/widgets/custom_drawer.dart';
import '../../core/widgets/custom_text_filed.dart';
import 'data/demo_data.dart';

class EcommerceScreen extends StatefulWidget {
  const EcommerceScreen({super.key});

  @override
  State<EcommerceScreen> createState() => _EcommerceScreenState();
}

class _EcommerceScreenState extends State<EcommerceScreen> {
  final List<Map<String, dynamic>> _cartItems = [];

  late List<ProductModel> _visibleProducts;

  late double _minPrice;
  late double _maxPrice;
  late List<String> _allCategories;

  ProductFilters _filters = ProductFilters.empty;

  @override
  void initState() {
    super.initState();

    _visibleProducts = List<ProductModel>.from(demoProducts);

    final prices = demoProducts.map((p) => p.price.toDouble()).toList()..sort();
    _minPrice = prices.isEmpty ? 0 : prices.first;
    _maxPrice = prices.isEmpty ? 0 : prices.last;

    _allCategories =
        demoProducts.map((p) => p.category).toSet().toList()..sort();

    _filters = ProductFilters(
      categories: <String>{},
      priceRange: RangeValues(_minPrice, _maxPrice),
      sort: SortOption.none,
      searchQuery: '',
    );

    _apply();
  }

  void _addToCart(ProductModel product) {
    final existingIndex = _cartItems.indexWhere(
      (item) => item['id'] == product.id,
    );
    if (existingIndex != -1) {
      setState(() => _cartItems[existingIndex]['quantity'] += 1);
    } else {
      setState(() {
        _cartItems.add({
          'id': product.id,
          'title': product.name,
          'image': product.url,
          'price': product.price,
          'quantity': 1,
        });
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to cart'),
        backgroundColor: primaryColor,
      ),
    );
  }

  void _apply() {
    setState(() {
      _visibleProducts = applyProductFilters(demoProducts, _filters);
    });
  }

  void _openFilterSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return FilterBottomSheet(
          allCategories: _allCategories,
          minPrice: _minPrice,
          maxPrice: _maxPrice,
          initial: _filters,
          onChanged: (f) {
            // live preview
            _filters = f;
            _apply();
          },
          onApply: (f) {
            _filters = f;
            _apply();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final crossAxisCount = isTablet ? 3 : 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Learn",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: _openFilterSheet,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.cart,
                arguments: _cartItems,
              );
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          children: [
            CustomTextFiled(
              hintText: 'Search',
              prefixIcon: Icons.search,
              isPassword: false,
              onChanged: (val) {
                _filters = _filters.copyWith(
                  searchQuery: (val ?? '').toString(),
                );
                _apply();
              },
            ),
            const SizedBox(height: 12),

            Expanded(
              child: GridView.builder(
                itemCount: _visibleProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final product = _visibleProducts[index];
                  return CustomCard(
                    buttonOnPressed: () => _addToCart(product),
                    product: product,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.details,
                        arguments: {
                          'product': product,
                          'cartItems': _cartItems,
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
