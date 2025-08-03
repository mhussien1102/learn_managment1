import 'package:flutter/material.dart';
import '../../core/service/cart_service.dart';
import '../../core/utils/constants.dart';
import '../../core/model/product_model.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/utils/app_routes.dart';

class DetailsScreen extends StatefulWidget {
  final ProductModel product;
  final List<Map<String, dynamic>> cartItems;

  const DetailsScreen({
    super.key,
    required this.product,
    required this.cartItems,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final CartService _cartService;

  @override
  void initState() {
    super.initState();
    _cartService = CartService(widget.cartItems);
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: primaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.product.name,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.product.url,
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(widget.product.desc, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            Text(
              'Price: ${widget.product.price} L.E',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 12),
            Text(
              'Brand: ${widget.product.author}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Category: ${widget.product.category}',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            CustomButton(
              text: 'Add to Cart',
              backgroundColor: primaryColor,
              textColor: Colors.white,
              onPressed: () {
                _cartService.addToCart(
                  widget.product,
                  () => setState(() {}),
                  _showSnack,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
