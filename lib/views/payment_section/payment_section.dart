import 'package:flutter/material.dart';

import 'payment_card.dart';

class PaymentSectionScreen extends StatefulWidget {
  const PaymentSectionScreen({super.key});

  @override
  State<PaymentSectionScreen> createState() => _PaymentSectionScreenState();
}

class _PaymentSectionScreenState extends State<PaymentSectionScreen> {
  PaymentType selectedPaymentType = PaymentType.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Section")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 16),
                itemCount: 3,
                primary: false,
        
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: PaymentCard(isActive: false, onTap: () {}),
                  );
                },
              ),
            ),
        
            // if (selectedPaymentType == PaymentType.online) ...[
            //     _buildPaymentMethodsWidget()
            //     // const CircularProgressIndicator(),
            //   ]
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodsWidget() {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 16),
        shrinkWrap: true,
        itemCount: 5,
        // itemCount: ref
        //     .read(masterControllerProvider.notifier)
        //     .materModel
        //     .data
        //     .paymentGateways
        //     .length,
        itemBuilder: (context, index) {
          // final paymentMethod = ref
          //     .read(masterControllerProvider.notifier)
          //     .materModel
          //     .data
          //     .paymentGateways[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: PaymentCard(
              onTap: () {
                // ref.read(selectedPayment.notifier).state = paymentMethod.name;
              },
              isActive: false,
              // paymentGateways: null,
              //isActive: ref.watch(selectedPayment) == paymentMethod.name,
              //paymentGateways: paymentMethod,
            ),
          );
        },
      ),
    );
  }
}

// payment Type
enum PaymentType { cash, online, none }
