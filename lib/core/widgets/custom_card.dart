import 'package:flutter/material.dart';
import '../model/product_model.dart';
import '../utils/constants.dart';
import 'custom_button.dart';

class CustomCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onPressed;

  const CustomCard({super.key, required this.product, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final isTablet = screenWidth > 600;
    final cardWidth = isTablet ? screenWidth / 3 - 24 : screenWidth / 2 - 24;
    final imageHeight = screenHeight * 0.12;
    final totalHeight = imageHeight + 190;

    return SizedBox(
      width: cardWidth,
      height: totalHeight,
      child: InkWell(
        onTap: onPressed, // navigate to details screen
        borderRadius: BorderRadius.circular(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          shadowColor: Colors.grey.withOpacity(0.3),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Container(
                  height: imageHeight,
                  width: double.infinity,
                  color: Colors.grey.shade100,
                  child: Image.asset(
                    product.url,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${product.price} L.E',
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Sales: ${product.sales}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: screenWidth * 0.028,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 38,
                  child: CustomButton(
                    onPressed: onPressed,
                    text: 'Add to Cart',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
