import 'package:apitest/compoment/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../compoment/custom_button.dart';

class RegestionScreen extends StatelessWidget {
   RegestionScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Regestion")),
      body: Column(
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
              PrimaryButton(
                text: "SignUp",
                onPressed: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),  


        ],
      )
    );
  }
}
