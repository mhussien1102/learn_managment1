import 'package:flutter/material.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/constants.dart';
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

  void _addToCart(product) {
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
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: demoProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final product = demoProducts[index];
                  return CustomCard(
                    buttonOnPressed: () {
                      _addToCart(product);
                    },
                    product: product,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.details,
                        arguments: product,
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
