import 'package:flutter/material.dart';

import 'widgets/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController pinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Otp Screen")),
      body: Column(
        children: [
            PinPutWidget(
                    pinCodeController: pinCodeController,
                    onCompleted: (pin) {},
                    validator: (value) {
                      return null;
                    },
                  ),


        ],
      ),
    );
  }
}
