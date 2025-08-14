import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text_filed.dart';
import '../../ecommerce/widgets/payment_method_option.dart';
import '../../ecommerce/widgets/text_filed_phone_widget.dart';

class AppointmentPaymentMethods extends StatelessWidget {
  final String selectedPayment;
  final ValueChanged<String> onPaymentChanged;
  final bool isPhoneRequired;
  final TextEditingController phoneCtrl;

  const AppointmentPaymentMethods({
    super.key,
    required this.selectedPayment,
    required this.onPaymentChanged,
    required this.isPhoneRequired,
    required this.phoneCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentMethodOption(
          value: "Vodafone Cash",
          groupValue: selectedPayment,
          onChanged: (val) => onPaymentChanged(val!),
          icon: Icons.phone_android,
        ),
        PaymentMethodOption(
          value: "InstaPay",
          groupValue: selectedPayment,
          onChanged: (val) => onPaymentChanged(val!),
          icon: Icons.account_balance_wallet,
        ),
        PaymentMethodOption(
          value: "Cash in the center",
          groupValue: selectedPayment,
          onChanged: (val) => onPaymentChanged(val!),
          icon: Icons.store,
        ),
        if (isPhoneRequired) ...[
          const SizedBox(height: 10),
          TextFiledPhoneWidget(
            phoneController: phoneCtrl,
            txt: "Enter Phone Number",
          ),
        ],
      ],
    );
  }
}
