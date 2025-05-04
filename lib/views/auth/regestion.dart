import 'package:apitest/compoment/custom_textfield.dart';
import 'package:apitest/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../compoment/custom_button.dart';
import '../../models/auth_model/sign_up.dart';

class RegestionScreen extends StatelessWidget {
   RegestionScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Regestion")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
             CustomTextField(
                  label: "name",
                  isRequired: true,
                  hint: "Enter your name",
                  controller: nameController,
                ),
                SizedBox(height: 12,),
                 CustomTextField(
                  label: "Email",
                  isRequired: true,
                  hint: "Enter your email",
                  controller: emailController,
                ),
                SizedBox(height: 12,),
                 CustomTextField(
                  label: "phone",
                  isRequired: true,
                  hint: "Enter your phone",
                  controller: phoneController,
                ),
                SizedBox(height: 12,),
                 CustomTextField(
                  label: "password",
                  isRequired: true,
                  hint: "Enter your password",
                  controller: passController,
                ),
                SizedBox(height: 40,),
                Consumer(
                  builder: (context, ref, child) {
                    return PrimaryButton(
                      text: "SignUp",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // calling api
                          ref.read(authControllerProvider.notifier).singUp(
                            singUpInfo: SignUpModel(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passController.text,

                            ),
                          );
                          print(emailController.text);
                          
                          
                    
                         
                        }
                      
                      },
                    );
                  }
                ),  
        
        
          ],
        ),
      )
    );
  }
}
