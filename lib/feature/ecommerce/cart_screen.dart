import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/ecommerce/widgets/cart_item.dart';

import '../../core/utils/constants.dart';
import '../../core/widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double getTotalPrice() {
    return widget.cartItems.fold(
      0.0,
      (sum, item) =>
          sum + (item['price'].toDouble()) * (item['quantity'] as int), // ✅ Fix
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            backgroundColor: primaryColor,
            title: const Text("Cart", style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final item = widget.cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CartItem(
                      image: item['image'],
                      title: item['title'],
                      price:
                          'LE ${(item['price'] * item['quantity']).toStringAsFixed(2)}',
                      quantity: item['quantity'],
                      onAdd: () {
                        setState(() {
                          item['quantity']++;
                        });
                      },
                      onSubtract: () {
                        if (item['quantity'] > 1) {
                          setState(() {
                            item['quantity']--;
                          });
                        }
                      },
                      onDelete: () {
                        setState(() {
                          widget.cartItems.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "LE ${getTotalPrice().toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(onPressed: () {}, text: "Checkout"),
          ],
        ),
      ),
    );
  }
}
