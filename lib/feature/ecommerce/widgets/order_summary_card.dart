import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const OrderSummaryCard({super.key, required this.cartItems});

  double getTotalPrice() {
    return cartItems.fold(
      0.0,
      (sum, item) =>
          sum + (item['price'].toDouble()) * (item['quantity'] as int),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ...cartItems.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['title']),
                  Text("${item['price'] * item['quantity']}\$"),
                ],
              ),
            );
          }).toList(),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${getTotalPrice().toStringAsFixed(2)}\$",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
