import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final bool isNumeric;
  final bool isPassword;
  final String? hint;
  final TextEditingController? controller;
  final TextInputAction? inputAction;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    required this.label,
    this.isRequired = false,
    this.isNumeric = false,
    this.isPassword = false,
    this.hint,
    this.controller,
    this.inputAction,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        textInputAction: inputAction,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: isRequired ? "$label *" : label,
          hintText: hint,
          labelStyle: const TextStyle(color: Color(0xffACACAC)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xffE7E7E7)),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return "$label is required";
          }
          if (isNumeric &&
              value != null &&
              value.isNotEmpty &&
              !RegExp(r'^[0-9]+$').hasMatch(value)) {
            return "Enter a valid number";
          }
          return null;
        },
      ),
    );
  }
}
