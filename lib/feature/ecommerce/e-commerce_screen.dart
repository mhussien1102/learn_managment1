import 'package:flutter/material.dart';
import '../../core/model/product_model.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_card.dart';
import '../../core/widgets/custom_drawer.dart';
import '../../core/widgets/custom_text_filed.dart';
import 'data/demo_data.dart';

// demoProducts is assumed to be List<ProductModel>

class EcommerceScreen extends StatefulWidget {
  const EcommerceScreen({super.key});

  @override
  State<EcommerceScreen> createState() => _EcommerceScreenState();
}

class _EcommerceScreenState extends State<EcommerceScreen> {
  // ---------------- CART ----------------
  final List<Map<String, dynamic>> _cartItems = [];

  void _addToCart(ProductModel product) {
    final existingIndex = _cartItems.indexWhere(
      (item) => item['id'] == product.id,
    );
    if (existingIndex != -1) {
      setState(() {
        _cartItems[existingIndex]['quantity'] += 1;
      });
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
      SnackBar(
        content: Text('${product.name} added to cart'),
        backgroundColor: primaryColor,
      ),
    );
  }

  // ---------------- FILTER/SEARCH STATE ----------------
  late List<ProductModel> _visibleProducts;

  // price (int in model, use double for the slider)
  late double _minPrice;
  late double _maxPrice;
  RangeValues? _priceRange;

  // category
  late final List<String> _allCategories;
  final Set<String> _selectedCategories = {};

  // sort + search
  String _sort =
      'none'; // 'none' | 'price_asc' | 'price_desc' | 'name_asc' | 'sales_desc'
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    // start with all products visible
    _visibleProducts = List<ProductModel>.from(demoProducts);

    // compute price bounds
    final prices = demoProducts.map((p) => p.price.toDouble()).toList()..sort();
    _minPrice = prices.isEmpty ? 0 : prices.first;
    _maxPrice = prices.isEmpty ? 0 : prices.last;
    _priceRange = RangeValues(_minPrice, _maxPrice);

    // collect categories
    final cats = demoProducts.map((p) => p.category).toSet().toList()..sort();
    _allCategories = cats;

    _applyFilters(); // initial compute
  }

  void _applyFilters() {
    final q = _searchQuery.trim().toLowerCase();
    final r = _priceRange ?? RangeValues(_minPrice, _maxPrice);

    List<ProductModel> filtered =
        demoProducts.where((p) {
          final inSearch =
              q.isEmpty ||
              p.name.toLowerCase().contains(q) ||
              p.author.toLowerCase().contains(q);
          final price = p.price.toDouble();
          final inPrice = price >= r.start && price <= r.end;
          final inCat =
              _selectedCategories.isEmpty
                  ? true
                  : _selectedCategories.contains(p.category);
          return inSearch && inPrice && inCat;
        }).toList();

    // sorting
    switch (_sort) {
      case 'price_asc':
        filtered.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'price_desc':
        filtered.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'name_asc':
        filtered.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
        break;
      case 'sales_desc':
        filtered.sort((a, b) => b.sales.compareTo(a.sales));
        break;
      case 'none':
      default:
        break;
    }

    setState(() => _visibleProducts = filtered);
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
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          ),
          child: StatefulBuilder(
            builder: (context, setModalState) {
              RangeValues values =
                  _priceRange ?? RangeValues(_minPrice, _maxPrice);

              void updateLive(void Function() fn) {
                setModalState(fn);
                _applyFilters(); // live preview while sheet is open
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedCategories.clear();
                            _priceRange = RangeValues(_minPrice, _maxPrice);
                            _sort = 'none';
                            _searchQuery = '';
                            _applyFilters();
                          });
                          Navigator.pop(ctx);
                        },
                        child: const Text(
                          'Reset',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Categories
                  if (_allCategories.isNotEmpty) ...[
                    const Text(
                      'Categories',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          _allCategories.map((c) {
                            final selected = _selectedCategories.contains(c);
                            return FilterChip(
                              label: Text(
                                c,
                                style: TextStyle(
                                  color:
                                      selected
                                          ? Colors.white
                                          : primaryColor, // ✅ Text color
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              selected: selected,
                              backgroundColor:
                                  Colors.transparent, // ✅ Default background
                              selectedColor:
                                  primaryColor, // ✅ Selected background
                              shape: StadiumBorder(
                                side: BorderSide(
                                  color: primaryColor, // ✅ Outline color
                                  width: 1.2,
                                ),
                              ),
                              onSelected:
                                  (v) => updateLive(() {
                                    if (v) {
                                      _selectedCategories.add(c);
                                    } else {
                                      _selectedCategories.remove(c);
                                    }
                                  }),
                            );
                          }).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Price
                  Text(
                    'Price (${values.start.toStringAsFixed(0)} - ${values.end.toStringAsFixed(0)})',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  RangeSlider(
                    activeColor: primaryColor,
                    min: _minPrice,
                    max: _maxPrice,
                    values: values,
                    onChanged:
                        (v) => updateLive(() {
                          _priceRange = v;
                        }),
                  ),
                  const SizedBox(height: 8),

                  // Sort
                  const Text(
                    'Sort by',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  DropdownButton<String>(
                    dropdownColor: primaryColor, // menu background color
                    value: _sort,
                    isExpanded: true,
                    style: const TextStyle(
                      // ✅ closed dropdown selected item style
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'none',
                        child: Text(
                          'None',
                          style: TextStyle(
                            color:
                                _sort == 'none' ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'price_asc',
                        child: Text(
                          'Price: Low to High',
                          style: TextStyle(
                            color:
                                _sort == 'price_asc'
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'price_desc',
                        child: Text(
                          'Price: High to Low',
                          style: TextStyle(
                            color:
                                _sort == 'price_desc'
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'name_asc',
                        child: Text(
                          'Name (A–Z)',
                          style: TextStyle(
                            color:
                                _sort == 'name_asc'
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'sales_desc',
                        child: Text(
                          'Best Sellers',
                          style: TextStyle(
                            color:
                                _sort == 'sales_desc'
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ),
                    ],
                    onChanged:
                        (v) => updateLive(() {
                          _sort = v ?? 'none';
                        }),
                  ),
                  const SizedBox(height: 16),

                  // Close
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: primaryColor,
                          ),
                          onPressed: () => Navigator.pop(ctx),
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
              );
            },
          ),
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
          // NEW: Filter icon
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: _openFilterSheet,
          ),
          // Cart icon
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
            // ✅ If CustomTextFiled exposes onChanged, this works:
            CustomTextFiled(
              hintText: 'Search',
              prefixIcon: Icons.search,
              isPassword: false,
              onChanged: (val) {
                _searchQuery = (val ?? '').toString();
                _applyFilters();
              },
            ),

            // ❌ If your CustomTextFiled does NOT have onChanged, comment the above and use:
            // TextField(
            //   decoration: const InputDecoration(
            //     hintText: 'Search',
            //     prefixIcon: Icon(Icons.search),
            //     border: OutlineInputBorder(),
            //   ),
            //   onChanged: (val) {
            //     _searchQuery = val;
            //     _applyFilters();
            //   },
            // ),
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
