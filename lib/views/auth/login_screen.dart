import 'package:apitest/compoment/custom_button.dart';
import 'package:apitest/compoment/custom_textfield.dart';
import 'package:apitest/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../payment_section/payment_section.dart';
import 'Forget_password_screen.dart';
import 'regestion.dart';
// import the file where CustomTextField is defined

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,

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
                  Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ForgetPasswordScreen()));
                }, child: Text("Forgot Password"),)),
                 const SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  final isLoading = ref.watch(authControllerProvider);

                  if (isLoading) {
                    return const CircularProgressIndicator();
                  }

                  return PrimaryButton(
                    text: "Login",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ref
                            .read(authControllerProvider.notifier)
                            .login(
                              phone: emailController.text,
                              password: passwordController.text,
                            )
                            .then((value) {
                              if (value.isSuccess) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(value.message)),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(value.message)),
                                );
                              }
                            });
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 20),

              // payment button
              PrimaryButton(
                text: "Payment",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PaymentSectionScreen()),
                  );
                },

                
              ),
              SizedBox(height: 20),

              //regesetion
               PrimaryButton(
                text: "Regestration",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RegestionScreen()),
                  );
                },

                
              ),


            ],
          ),
        ),
      ),
    );
  }
}
