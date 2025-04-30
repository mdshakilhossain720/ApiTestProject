// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:apitest/views/payment_section/payment_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentCard extends StatelessWidget {
  //final PaymentGateways paymentGateways;
  final bool isActive;
  final void Function()? onTap;
  const PaymentCard({
    super.key,
    // required this.paymentGateways,
    required this.isActive,
    required this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isActive
                      ? Color.fromARGB(255, 70, 9, 224)
                      : Colors.amberAccent,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/radio.svg",
                      width: 22,
                      colorFilter: ColorFilter.mode(
                        isActive
                            ? Color.fromARGB(255, 70, 9, 224)
                            : Colors.amberAccent,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("Strinp"),
                  ],
                ),
              ),
              // CachedNetworkImage(
              //   imageUrl: paymentGateways.logo,
              //   placeholder: (context, url) =>
              //       const CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => const Icon(Icons.error),
              //   width: 80,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
