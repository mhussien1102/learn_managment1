import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/ecommerce/widgets/order_summary_card.dart';
import 'package:learn_managment1/feature/ecommerce/widgets/text_filed_phone_widget.dart';
import 'package:learn_managment1/feature/ecommerce/widgets/payment_method_option.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_button.dart';

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
            OrderSummaryCard(cartItems: widget.cartItems),

            const SizedBox(height: 20),
            const Text(
              "Payment Method",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),

            PaymentMethodOption(
              value: "Vodafone Cash",
              groupValue: selectedPayment,
              onChanged: (val) => setState(() => selectedPayment = val!),
              icon: Icons.phone_android,
            ),
            PaymentMethodOption(
              value: "InstaPay",
              groupValue: selectedPayment,
              onChanged: (val) => setState(() => selectedPayment = val!),
              icon: Icons.account_balance_wallet,
            ),
            PaymentMethodOption(
              value: "Cash in Center",
              groupValue: selectedPayment,
              onChanged: (val) => setState(() => selectedPayment = val!),
              icon: Icons.store,
            ),

            if (selectedPayment == "Vodafone Cash" ||
                selectedPayment == "InstaPay") ...[
              const SizedBox(height: 10),
              TextFiledPhoneWidget(
                phoneController: phoneController,
                txt: "Enter Phone Number",
              ),
            ],

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onPressed: () {
                  if ((selectedPayment == "Vodafone Cash" ||
                          selectedPayment == "InstaPay") &&
                      phoneController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Please enter your phone number"),
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Payment method: $selectedPayment")),
                  );
                },
                text: 'Pay Now',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
