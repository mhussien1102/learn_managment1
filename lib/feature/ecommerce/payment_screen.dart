import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/ecommerce/widgets/order_summary_card.dart';
import '../../core/utils/constants.dart';

class PaymentScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const PaymentScreen({super.key, required this.cartItems});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPayment = "Vodafone Cash";
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text("Payment", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Order Summary",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),

            /// ✅ استخدام الـ widget الجديد هنا:
            OrderSummaryCard(cartItems: widget.cartItems),

            const SizedBox(height: 20),
            const Text(
              "Payment Method",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Column(
              children:
                  ["Vodafone Cash", "InstaPay", "Cash in Center"]
                      .map(
                        (method) => ListTile(
                          leading: Icon(_getIconForMethod(method)),
                          title: Text(method),
                          trailing: Radio<String>(
                            value: method,
                            groupValue: selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                selectedPayment = value!;
                              });
                            },
                          ),
                        ),
                      )
                      .toList(),
            ),
            if (selectedPayment == "Vodafone Cash" ||
                selectedPayment == "InstaPay") ...[
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if ((selectedPayment == "Vodafone Cash" ||
                          selectedPayment == "InstaPay") &&
                      phoneController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter your phone number"),
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Payment method: $selectedPayment")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Pay Now", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForMethod(String method) {
    switch (method) {
      case "Vodafone Cash":
        return Icons.phone_android;
      case "InstaPay":
        return Icons.account_balance_wallet;
      case "Cash in Center":
        return Icons.store;
      default:
        return Icons.payment;
    }
  }
}
