import 'package:apitest/views/auth/otp_screem.dart';
import 'package:flutter/material.dart';

import '../../compoment/custom_button.dart';
import '../../compoment/custom_textfield.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forget Password")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
            CustomTextField(
                label: "Email",
                isRequired: true,
                hint: "Enter your email",
                controller: emailController,
              ),
               SizedBox(height: 50),


              PrimaryButton(
                text: "Submit",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
                
                },
              ),





        ],
      ),
    );
  }
}
