import 'package:apitest/compoment/custom_button.dart';
import 'package:apitest/compoment/custom_textfield.dart';
import 'package:flutter/material.dart';
// import the file where CustomTextField is defined

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                label: "Email",
                isRequired: true,
                hint: "Enter your email",
                controller: emailController,
              ),
              CustomTextField(
                label: "Password",
                isRequired: true,
                isPassword: true,
                hint: "Enter your password",
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: "Login",
                onPressed: () {
            
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
