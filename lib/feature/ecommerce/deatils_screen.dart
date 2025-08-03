import 'package:flutter/material.dart';
import '../../core/utils/constants.dart';
import '../../core/model/product_model.dart';
import '../../core/widgets/custom_button.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel product;

  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          product.name,
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
              child: Image.asset(product.url, height: 180, fit: BoxFit.contain),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(product.desc, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            Text(
              'Price: ${product.price} L.E',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 12),
            Text(
              'Brand: ${product.author}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Category: ${product.category}',
              style: const TextStyle(fontSize: 16),
            ),
            Spacer(),
            CustomButton(
              text: 'Add to Cart',
              backgroundColor: primaryColor,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
