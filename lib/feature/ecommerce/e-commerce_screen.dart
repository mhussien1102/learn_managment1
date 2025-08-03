import 'package:flutter/material.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_card.dart';
import '../../core/widgets/custom_drawer.dart';
import '../../core/widgets/custom_text_filed.dart';
import 'data/demo_data.dart';

class EcommerceScreen extends StatelessWidget {
  const EcommerceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final isTablet = screenWidth > 600;
    final crossAxisCount = isTablet ? 3 : 2;
    final cardWidth = screenWidth / crossAxisCount - 24;
    final imageHeight = screenHeight * 0.15;

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
            onPressed: () {},
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
                  return CustomCard(
                    product: demoProducts[index],
                    onPressed: () {
                      // Add to cart action
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
