import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  OtpScreen({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pinput Example'),
        ),
        body: Center(
          child: Pinput(
            length: 6,
            controller: _controller,
            onChanged: (value) {
              // Code to execute when there is a change in the entered values
            },
            defaultPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: const TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(30, 60, 87, 1),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      
    );
  }
}
